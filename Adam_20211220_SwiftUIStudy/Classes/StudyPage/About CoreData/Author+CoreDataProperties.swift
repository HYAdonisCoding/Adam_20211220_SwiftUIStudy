//
//  Author+CoreDataProperties.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//
//

import Foundation
import CoreData


extension Author {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Author> {
        return NSFetchRequest<Author>(entityName: "Author")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var article: NSSet?

    public var articles: [Article] {
        guard let article = article,
              let articles = Array(article) as? [Article]
        else {
            return []
        }
        return articles
    }
}

// MARK: Generated accessors for article
extension Author {

    @objc(addArticleObject:)
    @NSManaged public func addToArticle(_ value: Article)

    @objc(removeArticleObject:)
    @NSManaged public func removeFromArticle(_ value: Article)

    @objc(addArticle:)
    @NSManaged public func addToArticle(_ values: NSSet)

    @objc(removeArticle:)
    @NSManaged public func removeFromArticle(_ values: NSSet)

}

extension Author : Identifiable {

}
