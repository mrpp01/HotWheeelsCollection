//
//  ViewController.swift
//  HotWheelsCollection
//
//  Created by Khanh T Pham on 12/28/16.
//  Copyright © 2016 Khanh T Pham. All rights reserved.
//

import UIKit
import Photos
import CoreData

class ViewController: UIViewController {
  
  var coreDataStack: CoreDataStack!
  var fetchedResultController: NSFetchedResultsController<Version>!
  
  @IBOutlet weak var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tbc = self.tabBarController as! TabBarViewController
    coreDataStack = tbc.coreDataStack
    
    let fetchRequest: NSFetchRequest<Version> = Version.fetchRequest()
    
    let sort = NSSortDescriptor(key: #keyPath(Version.colNumber), ascending: true)
    fetchRequest.sortDescriptors = [sort]
    
    fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                         managedObjectContext: coreDataStack.managedContext,
                                                         sectionNameKeyPath: nil,
                                                         cacheName: nil)
    
    do {
      try fetchedResultController.performFetch()
    } catch let error as NSError {
      print("Fetch error: \(error), \(error.userInfo)")
    }
    
  }

}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}

extension ViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    
    guard let sections = fetchedResultController.sections else {
      return 0
    }
    
    return sections.count
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    guard let sectionInfo = fetchedResultController.sections?[section]  else {
      return 0
    }
    
    return sectionInfo.numberOfObjects
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collection Cell", for: indexPath) as! CollectionViewCell
    
    let currentVariation = fetchedResultController.object(at: indexPath)
    
    cell.imageView.image = #imageLiteral(resourceName: "image")
    cell.labelView.text = currentVariation.name
    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let width = collectionView.frame.width / 3 - 1
    
    let height = width / 2 * 3 
    
    return CGSize(width: width, height: height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
}

