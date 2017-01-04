//
//  Manuafacturer+CoreDataProperties.swift
//  HotWheelsCollection
//
//  Created by Khanh T Pham on 1/2/17.
//  Copyright © 2017 Khanh T Pham. All rights reserved.
//

import Foundation
import CoreData


extension Manuafacturer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Manuafacturer> {
        return NSFetchRequest<Manuafacturer>(entityName: "Manuafacturer");
    }

    @NSManaged public var name: String?
    @NSManaged public var castings: NSSet?

}

// MARK: Generated accessors for castings
extension Manuafacturer {

    @objc(addCastingsObject:)
    @NSManaged public func addToCastings(_ value: Casting)

    @objc(removeCastingsObject:)
    @NSManaged public func removeFromCastings(_ value: Casting)

    @objc(addCastings:)
    @NSManaged public func addToCastings(_ values: NSSet)

    @objc(removeCastings:)
    @NSManaged public func removeFromCastings(_ values: NSSet)

}
