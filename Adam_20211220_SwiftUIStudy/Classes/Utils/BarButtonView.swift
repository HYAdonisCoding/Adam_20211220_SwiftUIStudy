//
//  BarButtonView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/6.
//

import SwiftUI
enum BarButtonType {
    case close, scan
}

struct BarButtonView: View {
    var type: BarButtonType = .close
    var imageName: String {
        switch type {
        case .close:
            return "xmark.circle"
        case .scan:
            return "qrcode.viewfinder"
        }
    }
    var title: String {
        switch type {
        case .close:
            return "关闭"
        case .scan:
            return "扫一扫"
        }
    }
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .foregroundColor(.black)
            Text(title).font(.system(size: 10))
                .foregroundColor(.black)
        }
    }
}

struct CloseView_Previews: PreviewProvider {
    static var previews: some View {
        BarButtonView()
    }
}
