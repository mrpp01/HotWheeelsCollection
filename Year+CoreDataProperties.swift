//
//  Year+CoreDataProperties.swift
//  HotWheelsCollection
//
//  Created by Khanh T Pham on 1/2/17.
//  Copyright © 2017 Khanh T Pham. All rights reserved.
//

import Foundation
import CoreData


extension Year {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Year> {
        return NSFetchRequest<Year>(entityName: "Year");
    }

    @NSManaged public var name: Int16
    @NSManaged public var series: NSSet?

}

// MARK: Generated accessors for series
extension Year {

    @objc(addSeriesObject:)
    @NSManaged public func addToSeries(_ value: Series)

    @objc(removeSeriesObject:)
    @NSManaged public func removeFromSeries(_ value: Series)

    @objc(addSeries:)
    @NSManaged public func addToSeries(_ values: NSSet)

    @objc(removeSeries:)
    @NSManaged public func removeFromSeries(_ values: NSSet)

}
