//
//  FirstPagePresentTCell.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/6.
//

import SwiftUI

struct FirstPagePresentTCell: View {
    @Environment(\.managedObjectContext) var context

    init(_ pushViewClass: Any, _ title: String, _ subTitle: String = "") {
        self.pushViewClass = pushViewClass
        self.title = title
        self.subTitle = subTitle
    }
    var pushViewClass: Any
    var title: String
    var subTitle: String
    
    @State private var showingSheet = false

    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.headline)
                .foregroundColor(randomColor())
            if (subTitle).isEmpty == false {
                Text(subTitle)
                    .font(.system(size: 12))
                    .foregroundColor(randomColor())
            }
        }
        .onTapGesture {
            showingSheet.toggle()
        }
        .fullScreenCover(isPresented: $showingSheet) {
            AnyView(_fromValue: pushViewClass)?.environment(\.managedObjectContext, self.context)
        }
    }
}

struct FirstPagePresentTCell_Previews: PreviewProvider {
    static var previews: some View {
        FirstPagePresentTCell(AddAddressView(), "Test Title")
    }
}
