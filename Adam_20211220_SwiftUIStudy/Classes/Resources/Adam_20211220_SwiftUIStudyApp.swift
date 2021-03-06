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

extension UIApplication {
    /// 收起键盘
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
