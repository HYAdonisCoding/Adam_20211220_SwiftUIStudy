//
//  FirstPageTCell.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/22.
//

import SwiftUI

struct FirstPageTCell: View {
    @State private var colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.cyan, Color.blue, Color.purple, Color.brown]
    
    init(_ pushViewClass: Any, _ title: String) {
        self.pushViewClass = pushViewClass
        self.title = title

    }
    var pushViewClass: Any
    var title: String
    
    var body: some View {
         
        NavigationLink(destination: AnyView(_fromValue: pushViewClass)) {
            Text(title)
                .font(.headline)
                .foregroundColor(colors[Int.random(in: 0..<colors.count)])
                
                
        }
    }
}

struct FirstPageTCell_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageTCell(AddAddressView(), "Test Title")
    }
}
