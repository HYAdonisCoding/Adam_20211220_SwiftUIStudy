//
//  AnimatingBindingsView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/23.
//

import SwiftUI

struct AnimatingBindingsView: View {
    @State private var amount: CGFloat = 1
    var body: some View {
        VStack(spacing: 100) {
            Stepper("缩放下图",
                    value: $amount.animation(
                        Animation
                            .easeInOut(duration: 0.25)
                            .repeatCount(3)
                    ),
                    in: 1...2
            )
                .padding(.horizontal)
            
            Button("动画绑定") {
                
            }
            .padding(40)
            .foregroundColor(.white)
            .background(randomColor())
            .clipShape(Circle())
            .scaleEffect(amount)
        }
        
        
    }
}

struct AnimatingBindingsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingBindingsView()
    }
}
