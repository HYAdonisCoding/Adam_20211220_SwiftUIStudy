//
//  MultipleImplicitAnimationView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/23.
//

import SwiftUI

struct MultipleImplicitAnimationView: View {
    @State private var enabled = false
    var body: some View {
        Button("点我") {
            self.enabled.toggle()
        }
        .font(.largeTitle)
        .foregroundColor(.white)
        .frame(width: 200, height: 200)
        .padding(50)
        .background(enabled ? randomColor() : Color.black)
        .animation(nil)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
        
    }
}

struct MultipleImplicitAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MultipleImplicitAnimationView()
    }
}
