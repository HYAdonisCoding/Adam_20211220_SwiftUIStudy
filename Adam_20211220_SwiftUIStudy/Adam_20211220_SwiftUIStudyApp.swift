//
//  Adam_20211220_SwiftUIStudyApp.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/20.
//

import SwiftUI

@main
struct Adam_20211220_SwiftUIStudyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            FirstPageView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
