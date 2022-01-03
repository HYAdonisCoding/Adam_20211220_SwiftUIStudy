//
//  FirstPageTCell.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/22.
//

import SwiftUI

var colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.purple, Color.gray]
func randomColor() -> Color {
    colors[Int.random(in: 0..<colors.count)]
}

struct FirstPageTCell: View {
    @Environment(\.managedObjectContext) var context

    init(_ pushViewClass: Any, _ title: String, _ subTitle: String = "") {
        self.pushViewClass = pushViewClass
        self.title = title
        self.subTitle = subTitle
    }
    var pushViewClass: Any
    var title: String
    var subTitle: String
    
    var body: some View {
         
        NavigationLink(
            destination: AnyView(_fromValue: pushViewClass)?.environment(\.managedObjectContext, self.context)
        ) {
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
                
               
                
                
        }
    }
}

struct FirstPageTCell_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageTCell(AddAddressView(), "Test Title")
    }
}
