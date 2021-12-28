//
//  WebViewPage.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/28.
//

import SwiftUI
import WebKit

struct WebViewPage: UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> WKWebView  {
        let web = WKWebView()
        return web
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: URL(string: url)!)
        uiView.load(req)
        
    }

}

struct WebViewPage_Previews: PreviewProvider {
    static var previews: some View {
        WebViewPage(url: "https://www.baidu.com")
    }
}
