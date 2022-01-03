//
//  AttributesDefaultValueView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/3.
//

import SwiftUI
import CoreData

struct AttributesDefaultValueView: View {
    
    @FetchRequest(entity: Entity1.entity(), sortDescriptors: []) var entity1s: FetchedResults<Entity1>
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        VStack {
            ForEach(entity1s, id: \.self) {
                Text($0.warppedName)
            }
            
            Button("Add Data") {
                let entity1 = Entity1(context: self.managedObjectContext)
                entity1.name = "Adam"
                
                try? self.managedObjectContext.save()
            }
        }
    }
}

struct AttributesDefaultValueView_Previews: PreviewProvider {
    static var previews: some View {
        AttributesDefaultValueView()
    }
}
