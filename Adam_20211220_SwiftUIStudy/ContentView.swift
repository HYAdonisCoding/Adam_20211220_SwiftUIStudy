//
//  ContentView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    /// 双向绑定
    @State var name = ""
    @State var phone = ""
    @State var address = ""
    
    @State var typeIndex = 0
    
    @State var showAlert = false
    
    let tags = ["家", "学校", "单位"]
    
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    
                    HStack {
                        Text("收货人")
                        TextField("请填写收货人姓名", text: $name)
                    }
                    HStack {
                        Text("手机")
                        TextField("请填写收货人手机号码", text: $phone)
                    }
                    HStack {
                        Text("详细地址")
                        TextField("请填写收货人详细地址", text: $address)
                    }
                }
                Section(header: Text("标签")) {
                    Picker("标签", selection: $typeIndex) {
                        ForEach(0..<tags.count, id: \.self) { index in
                            Text(tags[index])
                        }
                        
                    }.pickerStyle(.segmented)
                }
                Section(header: Text("完成")) {
                    Button("填好了") {
                        // 点击操作
                        self.showAlert = true
                    }
                }
            }
            .navigationTitle(Text("添加收货地址"))
            .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("默认地址"),
                        message: Text("\(name)\n\(phone)\n\(address)\n\(typeIndex)"),
                        dismissButton: .default(Text("确认")))
                }
        }
    }

   
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
