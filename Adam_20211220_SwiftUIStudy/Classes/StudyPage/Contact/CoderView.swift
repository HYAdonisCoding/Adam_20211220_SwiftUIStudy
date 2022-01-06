//
//  CoderView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import SwiftUI
//import CodeScanner

enum CoderType {
    case all, apple, android
}

struct CoderView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var coders: Coders
    @State private var showSheet = false
    
    var coderType: CoderType
    
    var title: String {
        switch coderType {
        case .all:
            return "全栈开发者"
        case .apple:
            return "苹果开发者"
        case .android:
            return "安卓开发者"
        }
    }
    
    var filteredCoders: [Coder] {
        switch coderType {
        case .all:
            return coders.allCoders
        case .apple:
            return coders.allCoders.filter{ $0.isApple }
        case .android:
            return coders.allCoders.filter{ !$0.isApple }

        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredCoders) { coder in
                    VStack(alignment: .leading, spacing: 0) {
                        Text(coder.name).font(.headline)
                        Text(coder.phone).foregroundColor(.secondary)
                    }
                    .contextMenu{
                        Button(coder.isApple ? "标记为安卓开发者" : "标记为苹果开发者") {
                            self.coders.toggle(coder)
                        }
                    }
                }
                .onDelete(perform: deleteCoder)
            }
            .navigationBarTitle(title, displayMode: .inline)
            //            .navigationTitle(title)
            .navigationBarItems(
                leading: Button(action: {
                    self.showSheet.toggle()
                    
                }) {
                    BarButtonView(type: .scan)
                    
                    
                },
                trailing: Button(action: {
                    /// 关闭页面
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    VStack {
                        BarButtonView()
                    }
                }
            )
            .sheet(isPresented: $showSheet) {
                print("dismiss")
            } content: {
                //            CodeScannerView(codeTypes: [.qr], completion: self.handleScan)
                ManualAddCoderView { name, phone in
                    let coder = Coder()
                    coder.name = name
                    coder.phone = phone
                    coders.add(coder)
                }
            }
        }
        
        
    }
    func deleteCoder(indexSet: IndexSet) {
        for index in indexSet {
            coders.remove(filteredCoders[index])
        }
        
    }
    
//    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
//        showSheet = false
//        switch result {
//        case .success(let code):
//            let arr = code.components(separatedBy: "\n")
//            let coder = Coder()
//            coder.name = arr[0]
//            coder.phone = arr[1]
//            coders.add(coder)
//        case .failure(let error):
//            print("扫描失败：\(error.localizedDescription)")
//        }
//    }
}

struct CoderView_Previews: PreviewProvider {
    static var previews: some View {
        CoderView(coderType: .apple)
    }
}
