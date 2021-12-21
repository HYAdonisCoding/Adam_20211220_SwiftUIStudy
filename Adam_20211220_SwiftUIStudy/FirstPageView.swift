//
//  FirstPageView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/21.
//

import SwiftUI

struct FirstPageView: View {
    @State private var data = ["AddAddressView"]
    
    /// 点击触发push时的key
    @State var pushKey = false
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach(0..<data.count) { idx in
                    
                    NavigationLink(destination: AddAddressView(), label: {
                        Text(data[idx])
                    })
                }
            }
            /// Presented
//            .sheet(isPresented: $pushKey, onDismiss: {
//
//            }, content: {
//                AddAddressView()
//            })
            .listStyle(.plain)
            .navigationTitle(Text("Home"))
        }
        
    }
}

struct FirstPageView_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageView()
    }
}
