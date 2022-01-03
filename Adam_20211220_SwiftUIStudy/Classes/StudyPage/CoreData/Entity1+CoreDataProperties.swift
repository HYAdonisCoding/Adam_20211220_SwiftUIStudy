//
//  Entity1+CoreDataProperties.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/31.
//
//

import Foundation
import CoreData


extension Entity1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity1> {
        return NSFetchRequest<Entity1>(entityName: "Entity1")
    }

    @NSManaged public var name: String?

    public var wrappedName: String {
        name ?? "无名"
    }
}
