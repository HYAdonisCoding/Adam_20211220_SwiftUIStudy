//
//  ManualAddCoderView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/6.
//

import SwiftUI

struct ManualAddCoderView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var phone = ""
    var successHandler: ((_ name: String, _ phone: String) -> Void)?
    var body: some View {
        NavigationView {
            VStack {
                TextField("姓名", text: $name)
                TextField("电话", text: $phone)
                    .keyboardType(.numberPad)
                
                Button("添加") {
                    successHandler?(name, phone)
                    self.presentationMode.wrappedValue.dismiss()
                }
                
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("增加开发者", displayMode: .inline)
        }
        
        
    }
}

struct ManualAddCoderView_Previews: PreviewProvider {
    static var previews: some View {
        ManualAddCoderView()
    }
}
