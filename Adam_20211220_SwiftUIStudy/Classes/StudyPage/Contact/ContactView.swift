//
//  ContactView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import SwiftUI

struct ContactView: View {
    var coders = Coders()
    
    var body: some View {
        TabView {
            
            CoderView(coderType: .all)
                .tabItem {
                    Image(systemName: "person.3")
                    Text("FullStack")
                }

            CoderView(coderType: .apple)
                .tabItem {
                    Image(systemName: "person.2")
                    Text("iOS")
                }
            CoderView(coderType: .android)
                .tabItem {
                    Image(systemName: "person")
                    Text("Android")
                }

            MeView()
                .tabItem {
                    Image(systemName: "person.crop.square")
                    Text("Me")
                }
        }
        .environmentObject(coders)
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
