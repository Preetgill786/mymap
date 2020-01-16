//
//  Map+CoreDataProperties.swift
//  My Map
//
//  Created by MacStudent on 2020-01-16.
//  Copyright © 2020 MacStudent. All rights reserved.
//
//

import Foundation
import CoreData


extension Map {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Map> {
        return NSFetchRequest<Map>(entityName: "Map")
    }

    @NSManaged public var title: String?
    @NSManaged public var subTitle: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}
