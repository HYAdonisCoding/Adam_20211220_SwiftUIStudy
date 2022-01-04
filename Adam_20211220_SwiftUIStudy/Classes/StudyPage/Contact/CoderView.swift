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
    @EnvironmentObject var coders: Coders
    @State private var showSheet = false
    
    var coderType: CoderType {
        didSet {
            switch coderType {
            case .all:
                title = "全栈开发者"
            case .apple:
                title = "苹果开发者"
            case .android:
                title = "安卓开发者"
            }
        }
    }
    
    @State private var title: String  = ""
    
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
        }
        .navigationBarTitle(Text(title), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showSheet.toggle()
        }) {
            Image(systemName: "qrcode.viewfinder")
            Text("扫一扫")
        })
        .sheet(isPresented: $showSheet) {
            print("dismiss")
        } content: {
//            CodeScannerView(codeTypes: [.qr], completion: self.handleScan)
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
