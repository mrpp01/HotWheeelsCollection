//
//  Casting+CoreDataProperties.swift
//  HotWheelsCollection
//
//  Created by Khanh T Pham on 1/2/17.
//  Copyright © 2017 Khanh T Pham. All rights reserved.
//

import Foundation
import CoreData


extension Casting {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Casting> {
        return NSFetchRequest<Casting>(entityName: "Casting");
    }

    @NSManaged public var image: NSData?
    @NSManaged public var name: String?
    @NSManaged public var producedFrom: Int16
    @NSManaged public var producedUntil: Int16
    @NSManaged public var designer: Designer?
    @NSManaged public var manuafacturer: Manuafacturer?
    @NSManaged public var versions: NSSet?

}

// MARK: Generated accessors for versions
extension Casting {

    @objc(addVersionsObject:)
    @NSManaged public func addToVersions(_ value: Version)

    @objc(removeVersionsObject:)
    @NSManaged public func removeFromVersions(_ value: Version)

    @objc(addVersions:)
    @NSManaged public func addToVersions(_ values: NSSet)

    @objc(removeVersions:)
    @NSManaged public func removeFromVersions(_ values: NSSet)

}
