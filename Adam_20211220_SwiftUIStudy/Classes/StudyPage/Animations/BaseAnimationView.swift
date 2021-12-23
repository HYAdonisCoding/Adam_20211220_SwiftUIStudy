//
//  BaseAnimationView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/23.
//

import SwiftUI

struct BaseAnimationView: View {
    @State private var amount: CGFloat = 1
    @State private var amount2: CGFloat = 1
    var body: some View {
        VStack(spacing: 40) {
            /// 隐式动画 -- 基础
            Button("点我") {
                self.amount += 1
            }
            .foregroundColor(.white)
            .padding(30)
            .background(randomColor())
            .clipShape(Circle())
            .scaleEffect(amount)
            .blur(radius: amount - 1)
            .animation(.default)
            
            /// 隐式动画 -- 进阶
            Button("抢红包") {

            }
            .foregroundColor(.white)
            .padding(30)
            .background(Color.red)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.red)
                    .scaleEffect(amount2)
                    .opacity(Double(2 -  amount2))
                    .animation(
                        Animation.easeOut(duration: 1)
                            .repeatForever(autoreverses: false)
                    )
            )
            .onAppear {
                self.amount2 = 2
            }
        }
    }
}

struct BaseAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        BaseAnimationView()
    }
}
