//
//  Version+CoreDataProperties.swift
//  HotWheelsCollection
//
//  Created by Khanh T Pham on 1/2/17.
//  Copyright © 2017 Khanh T Pham. All rights reserved.
//

import Foundation
import CoreData


extension Version {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Version> {
        return NSFetchRequest<Version>(entityName: "Version");
    }

    @NSManaged public var color: String?
    @NSManaged public var images: NSData?
    @NSManaged public var name: String?
    @NSManaged public var colNumber: String?
    @NSManaged public var toyNumber: String?
    @NSManaged public var casting: Casting?
    @NSManaged public var wheelType: WheelType?
    @NSManaged public var year: Series?

}
