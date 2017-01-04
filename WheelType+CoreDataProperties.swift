//
//  WheelType+CoreDataProperties.swift
//  HotWheelsCollection
//
//  Created by Khanh T Pham on 1/2/17.
//  Copyright © 2017 Khanh T Pham. All rights reserved.
//

import Foundation
import CoreData


extension WheelType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WheelType> {
        return NSFetchRequest<WheelType>(entityName: "WheelType");
    }

    @NSManaged public var images: NSData?
    @NSManaged public var name: String?
    @NSManaged public var cars: NSSet?

}

// MARK: Generated accessors for cars
extension WheelType {

    @objc(addCarsObject:)
    @NSManaged public func addToCars(_ value: Version)

    @objc(removeCarsObject:)
    @NSManaged public func removeFromCars(_ value: Version)

    @objc(addCars:)
    @NSManaged public func addToCars(_ values: NSSet)

    @objc(removeCars:)
    @NSManaged public func removeFromCars(_ values: NSSet)

}
