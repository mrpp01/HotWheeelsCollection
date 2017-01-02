//
//  AppDelegate.swift
//  HotWheelsCollection
//
//  Created by Khanh T Pham on 12/28/16.
//  Copyright © 2016 Khanh T Pham. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    return true
  }

  func importJSONData() -> Void {
    
    let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")!
    let jsonData = NSData(contentsOf: jsonURL)
    
   
    
  }

}

