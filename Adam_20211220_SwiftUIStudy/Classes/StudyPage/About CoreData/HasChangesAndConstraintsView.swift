//
//  HasChangesAndConstraintsView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/3.
//

import SwiftUI

struct HasChangesAndConstraintsView: View {
    @FetchRequest(entity: Entity2.entity(),
                  sortDescriptors: []//,
//                  predicate: nil,
//                  animation: nil
    ) var entity2s: FetchedResults<Entity2>
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        VStack {
            List(entity2s, id: \.self) {
                Text($0.name ?? "name")
            }
            
            Button("Add Data") {
                let newData = Entity2(context: self.managedObjectContext)
                newData.name = "Adam"
                
            }
            Button("Save Data") {
                if self.managedObjectContext.hasChanges {
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

struct HasChangesAndConstraintsView_Previews: PreviewProvider {
    static var previews: some View {
        HasChangesAndConstraintsView()
    }
}
