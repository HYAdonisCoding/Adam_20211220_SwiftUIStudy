//
//  AEWebView.swift
//  Example
//
//  Created by Adam on 2021/12/28.
//  Copyright © 2021 晋先森. All rights reserved.
//

import SwiftUI

struct AEWebView: View {
    var body: some View {
        WebViewPage(url: "https://www.baidu.com")
            .navigationTitle("百度一下")
    }
    
}

struct AEWebView_Previews: PreviewProvider {
    static var previews: some View {
        AEWebView()
    }
}
