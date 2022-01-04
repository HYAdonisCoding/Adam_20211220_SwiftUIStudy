//
//  RelationshipsView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import SwiftUI

struct RelationshipsView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Author.entity(),
                  sortDescriptors: []
    ) var authors: FetchedResults<Author>
    var body: some View {
        VStack {
            List {
                ForEach(authors, id: \.self) { author in
                    Section(header: Text(author.name ?? "无名")) {
                        ForEach(author.articles, id: \.self) {
                            Text($0.title ?? "")
                        }
                    }
                }
            }
            Button("Add Data") {
                self.addData("我后悔的是创建了阿里巴巴", "马云")
                self.addData("我出生于普通家庭", "马化腾")
                self.addData("我真的一无所有", "王健林")
                self.addData("我会打一点兵乓球", "张继科")
                
                try? self.managedObjectContext.save()
            }
        }
    }
    
    func addData(_ title: String, _ authorName: String, _ content: String = "XXX",  _ authorAge: Int16 = 20) {
        let article = Article(context: self.managedObjectContext)
        article.title = title
        article.content = content
        article.author = Author(context: self.managedObjectContext)
        article.author?.name = authorName
        article.author?.age = authorAge
        
    }
}

struct RelationshipsView_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipsView()
    }
}
