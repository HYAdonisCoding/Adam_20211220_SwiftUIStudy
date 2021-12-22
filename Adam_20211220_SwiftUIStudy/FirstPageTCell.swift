//
//  FirstPageTCell.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/22.
//

import SwiftUI

struct FirstPageTCell: View {
    init(_ pushViewClass: Any, _ title: String) {
        self.pushViewClass = pushViewClass
        self.title = title

    }
    var pushViewClass: Any
    var title: String
    
    var body: some View {
         
        NavigationLink(destination: AnyView(_fromValue: pushViewClass)) {
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.purple)
                
                
        }
    }
}

struct FirstPageTCell_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageTCell(AddAddressView(), "Test Title")
    }
}
