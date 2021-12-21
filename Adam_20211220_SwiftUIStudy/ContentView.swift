//
//  ContentView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/20.
//

import SwiftUI
import CoreData
import Combine

struct ContentView: View {
    /// 双向绑定
    @State private var name = ""
    // 存储类实例
    @ObservedObject var loginInfo = LoginInfo()
    
    @State private var address = ""
    
    @State private var typeIndex = 0
    
    @State private var showAlert = false
    
    private let tags = ["家", "学校", "单位"]
    
    private var configMsg: String {
        """
        收货人: \(name)
        手机: \(loginInfo.phoneNo)
        详细地址: \(address)
        标签: \(tags[typeIndex])
        """
    }
    
    private var invalidInput: Bool {
        name.count < 2 || loginInfo.phoneNo.count != 11 || address.isEmpty
    }
    
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
                        
                        TextField("请填写收货人手机号码", text: $loginInfo.phoneNo, onEditingChanged: { (edit) in
                            print(self.loginInfo.phoneNo)
                        })
                            .keyboardType(.numberPad)
                            .textContentType(.telephoneNumber)
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
                    .disabled(invalidInput)
                }
            }
            .navigationTitle(Text("添加收货地址"))
            .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("默认地址"),
                        message: Text(self.configMsg),
                        dismissButton: .default(Text("确认")))
                }
            .onTapGesture {
                        // 点击空白出键盘消失
                        
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


class LoginInfo: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()

    @Published var phoneNo: String = "" {
        didSet {
            // 限制输入内容的长度，超长以后就使用oldValue
            if phoneNo.count > 11, oldValue.count <= 11 {
                phoneNo = oldValue
                updateUI()
            } else {
                // 关键代码
                // 判断输入内容是否为纯数字，否则使用oldValue
                if !phoneNo.validate("^[0-9]*$"), oldValue.validate("^[0-9]*$") {
                    phoneNo = oldValue
                    updateUI()
                }
            }
        }
    }
    func updateUI() {
        objectWillChange.send()
    }
}

extension String {
   func validate(_ regex: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES%@", regex)
        return predicate.evaluate(with: self)
    }
}
