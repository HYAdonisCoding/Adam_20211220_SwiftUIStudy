//
//  CardView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var removal: (() -> Void)?
    @State private var offset = CGSize.zero
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(
                        randomColor()
                            .opacity(1 - Double(abs(offset.width) / 50))
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(offset.width > 0 ? Color.green : Color.red)
                    )
                    .shadow(radius: 10)
                Text(card.question)
                    .font(.largeTitle)
            }
            .frame(maxWidth: geo.size.width*0.75, maxHeight: geo.size.width*0.75)
            .rotationEffect(.degrees(Double(offset.width/5)))
            .offset(x: offset.width * 5, y: 0)
            .opacity(2 - Double(abs(offset.width) / 50))
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        self.offset = value.translation
                    })
                    .onEnded({ value in
                        if abs(self.offset.width) > 100 {
                            self.removal?()
                        } else {
                            self.offset = .zero
                        }
                    }
                            )
                    
            )
            .animation(.spring())
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardsFromJSON[0]) {
            print("XXX")
        }
    }
}
