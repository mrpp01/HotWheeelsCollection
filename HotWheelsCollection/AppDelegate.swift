//
//  AppDelegate.swift
//  HotWheelsCollection
//
//  Created by Khanh T Pham on 12/28/16.
//  Copyright © 2016 Khanh T Pham. All rights reserved.
//

import UIKit
import CoreData
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  lazy var coreDataStack = CoreDataStack(modelName: "Model")
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    //importJSONDataIfNeeded()
    
    guard let tabBarController = window?.rootViewController as? TabBarViewController else {
      print("Failed at app delegate")
      return true
    }
    
    tabBarController.coreDataStack = coreDataStack
    print("Pass")
    return true
  }
  
  func importJSONDataIfNeeded() -> Void {
    
    let fetchRequest = NSFetchRequest<Year>(entityName: "Year")
    
    let count = try! coreDataStack.managedContext.count(for: fetchRequest)
    
    guard count == 0 else {
      print("Data loaded. Count: \(count)")
      
      return
    }
    
    do {
      let results = try coreDataStack.managedContext.fetch(fetchRequest)
      results.forEach({coreDataStack.managedContext.delete($0)})
      
      coreDataStack.saveContext()
      importJSONData()
    } catch let error as NSError  {
      print("Unresolved error: \(error), \(error.userInfo)")
    }
    
    
  }
  
  func importJSONData() -> Void {
    
    let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")!
    let jsonData = NSData(contentsOf: jsonURL) as! Data
    
    do {
      
      let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: [.allowFragments]) as! [AnyObject]
      
      let castingEntity = NSEntityDescription.entity(forEntityName: "Casting", in: coreDataStack.managedContext)!
      let manuafacturerEntity = NSEntityDescription.entity(forEntityName: "Manuafacturer", in: coreDataStack.managedContext)!
      let versionEntity = NSEntityDescription.entity(forEntityName: "Version", in: coreDataStack.managedContext)!
      let seriesEntity = NSEntityDescription.entity(forEntityName: "Series", in: coreDataStack.managedContext)!
      let yearEntity = NSEntityDescription.entity(forEntityName: "Year", in: coreDataStack.managedContext)!
      
      
      for jsonDictionary in jsonArray {
        
        let castingName = jsonDictionary["Name"] as! String
        let manuafacturerName = jsonDictionary["Manuafacturer"] as! String
        let colNumberVal = jsonDictionary["Col #"] as? NSNumber
        let colNumber = "\(colNumberVal)"
        let seriesName = jsonDictionary["Series"] as! String
        let yearVal = jsonDictionary["Year"] as! Int
        let toyNumber = jsonDictionary["Toy #"] as! String
        
        var casting: Casting?
        var manuafacturer: Manuafacturer?
        var version: Version?
        var series: Series?
        var year: Year?
        
        
        let castingFetch: NSFetchRequest<Casting> = Casting.fetchRequest()
        castingFetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Casting.name), castingName)
        
        do {
          let results = try coreDataStack.managedContext.fetch(castingFetch)
          if results.count > 0 {
            casting = results.first
          }
          else {
            casting = Casting(entity: castingEntity, insertInto: coreDataStack.managedContext)
            casting?.name = castingName
          }
        } catch let error as NSError {
          print("Unresolved error: \(error), \(error.userInfo)")
        }
        
        let manuafacturerFetch: NSFetchRequest<Manuafacturer> = Manuafacturer.fetchRequest()
        manuafacturerFetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Manuafacturer.name), manuafacturerName)
        
        do {
          let results = try coreDataStack.managedContext.fetch(manuafacturerFetch)
          if results.count > 0 {
            manuafacturer = results.first
          }
          else {
            manuafacturer = Manuafacturer(entity: manuafacturerEntity, insertInto: coreDataStack.managedContext)
            manuafacturer?.name = manuafacturerName
            
          }
        } catch let error as NSError {
          print("Unresolved error: \(error), \(error.userInfo)")
        }
        
        let versionFetch: NSFetchRequest<Version> = Version.fetchRequest()
        let colNumberPredicate = NSPredicate(format: "%K == %@", #keyPath(Version.toyNumber), toyNumber)
        let toyNumberPredicate = NSPredicate(format: "%K == %@", #keyPath(Version.colNumber), colNumber)
        versionFetch.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [colNumberPredicate, toyNumberPredicate])
        
        do {
          let results = try coreDataStack.managedContext.fetch(versionFetch)
          if results.count > 0 {
            version = results.first
          }
          else {
            version = Version(entity: versionEntity, insertInto: coreDataStack.managedContext)
            version?.name = castingName
            version?.colNumber = colNumber
            version?.toyNumber = toyNumber
            
          }
        } catch let error as NSError {
          print("Unresolved error: \(error), \(error.userInfo)")
        }
        
        
        //Series
        
        let seriesFetch: NSFetchRequest<Series> = Series.fetchRequest()
        seriesFetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Series.name), seriesName)
        
        do {
          let results = try coreDataStack.managedContext.fetch(seriesFetch)
          if results.count > 0 {
            
            series = results.first
            
          }
          else {
            
            series = Series(entity: seriesEntity, insertInto: coreDataStack.managedContext)
            series?.name = seriesName
          }
        } catch let error as NSError {
          print("Unresolved error: \(error), \(error.userInfo)")
        }
        
        let yearFetch: NSFetchRequest<Year> = Year.fetchRequest()
        yearFetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Year.name), NSNumber(value: yearVal))
        
        do {
          let results = try coreDataStack.managedContext.fetch(yearFetch)
          if results.count > 0 {
            
            year = results.first
            
          }
          else {
            year = Year(entity: yearEntity, insertInto: coreDataStack.managedContext)
            year?.name = Int16(yearVal)
            
          }
        } catch let error as NSError {
          print("Unresolved error: \(error), \(error.userInfo)")
        }
        
        casting?.versions?.adding(version)
        casting?.manuafacturer = manuafacturer
        year?.series?.adding(series)
        series?.versions?.adding(version)
        
      }
      
    } catch let error as NSError {
      print("Unresolved error: \(error), \(error.userInfo)")
    }
    
    coreDataStack.saveContext()
    
  }
  
}

