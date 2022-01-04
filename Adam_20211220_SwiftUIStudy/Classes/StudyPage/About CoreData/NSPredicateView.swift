//
//  NSPredicateView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import SwiftUI

struct NSPredicateView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    //1.最简单用法-不推荐
//    @FetchRequest(entity: Entity3.entity(),
//                  sortDescriptors: [],
//                  predicate: NSPredicate(format: "name == '马云'")
//    ) var entity3s: FetchedResults<Entity3>
    //2.基本用法--%@为占位符
//    @FetchRequest(entity: Entity3.entity(),
//                  sortDescriptors: [],
//                  predicate: NSPredicate(format: "name == %@", "马云")
//    ) var entity3s: FetchedResults<Entity3>
    
    //3.IN
//    @FetchRequest(entity: Entity3.entity(),
//                  sortDescriptors: [],
//                  predicate: NSPredicate(format: "name IN %@", ["马云", "李小龙"])
//    ) var entity3s: FetchedResults<Entity3>
    
    //4.BEGINSWITH，默认区分大小写，加[c]不区分大小写
//    @FetchRequest(entity: Entity3.entity(),
//                  sortDescriptors: [],
//                  predicate: NSPredicate(format: "englishName BEGINSWITH[c] %@", "b")
//    ) var entity3s: FetchedResults<Entity3>
    //5.CONTAINS
    @FetchRequest(entity: Entity3.entity(),
                  sortDescriptors: [],
                  predicate: NSPredicate(format: "englishName CONTAINS %@", "c")
    ) var entity3s: FetchedResults<Entity3>
    
    var body: some View {
        VStack {
            List(entity3s) { entity3 in
                VStack(alignment: .leading, spacing: 0) {
                    Text(entity3.name ?? "")
                    Text(entity3.englishName ?? "")
                }
                
            }
            Button("Add Data") {
                let newData1 = Entity3(context: self.managedObjectContext)
                newData1.name = "马云"
                newData1.englishName = "Jack Ma"
                
                let newData2 = Entity3(context: self.managedObjectContext)
                newData2.name = "库克"
                newData2.englishName = "Cook"
                
                let newData3 = Entity3(context: self.managedObjectContext)
                newData3.name = "李小龙"
                newData3.englishName = "Bruce Lee"
                
                try? self.managedObjectContext.save()
            }

        }
    }
}

struct NSPredicateView_Previews: PreviewProvider {
    static var previews: some View {
        NSPredicateView()
    }
}
