//
//  ExplictAnimationsView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/23.
//

import SwiftUI

struct ExplictAnimationsView: View {
    @State private var amount = 0.0
    var body: some View {
        Button("点我") {
            withAnimation(.interpolatingSpring(stiffness: 4, damping: 3)) {
                self.amount += 360
            }
        }
        .foregroundColor(.white)
        .padding(50)
        .background(randomColor())
        .clipShape(Circle())
        .rotation3DEffect(.degrees(amount), axis: (x: 0, y: 0, z: 1))    }
}

struct ExplictAnimationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExplictAnimationsView()
    }
}
