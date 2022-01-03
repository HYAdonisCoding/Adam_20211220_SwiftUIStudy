//
//  Entity1+CoreDataProperties.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/3.
//
//

import Foundation
import CoreData


extension Entity1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity1> {
        return NSFetchRequest<Entity1>(entityName: "Entity1")
    }

    @NSManaged public var name: String?

    public var warppedName: String {
        name ?? "No name"
    }
}

extension Entity1 : Identifiable {

}
