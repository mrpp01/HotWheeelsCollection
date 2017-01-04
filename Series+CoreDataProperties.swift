//
//  Series+CoreDataProperties.swift
//  HotWheelsCollection
//
//  Created by Khanh T Pham on 1/2/17.
//  Copyright © 2017 Khanh T Pham. All rights reserved.
//

import Foundation
import CoreData


extension Series {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Series> {
        return NSFetchRequest<Series>(entityName: "Series");
    }

    @NSManaged public var images: NSData?
    @NSManaged public var name: String?
    @NSManaged public var year: Year?
    @NSManaged public var versions: NSSet?

}

// MARK: Generated accessors for versions
extension Series {

    @objc(addVersionsObject:)
    @NSManaged public func addToVersions(_ value: Version)

    @objc(removeVersionsObject:)
    @NSManaged public func removeFromVersions(_ value: Version)

    @objc(addVersions:)
    @NSManaged public func addToVersions(_ values: NSSet)

    @objc(removeVersions:)
    @NSManaged public func removeFromVersions(_ values: NSSet)

}
