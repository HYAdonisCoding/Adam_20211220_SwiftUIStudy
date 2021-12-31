//
//  EmojiRatingView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/31.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("1⃣️")
        case 2:
            return Text("2⃣️")
        case 3:
            return Text("3⃣️")
        case 4:
            return Text("4⃣️")
        default:
            return Text("5⃣️")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
