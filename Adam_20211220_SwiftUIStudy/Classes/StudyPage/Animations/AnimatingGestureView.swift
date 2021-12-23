//
//  AnimatingGestureView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/23.
//

import SwiftUI

struct AnimatingGestureView: View {
    let letters = Array("学SwiftUI厚积薄发")
    
    @State private var dragOffset: CGSize = .zero
    @State private var dragOffset2: CGSize = .zero
    @State private var enabled = false
    
    var body: some View {
        VStack(spacing: 50) {
            // 拖拽+偏移动画
            LinearGradient(gradient:
                            Gradient(colors: [.yellow, .red]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing
            )
                .frame(width: 200, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragOffset)
                .gesture(
                    DragGesture()
                        .onChanged { self.dragOffset = $0.translation }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                self.dragOffset = .zero
                            }
                        }
                )
            
            //小实战
            HStack(spacing: 10) {
                ForEach(letters.indices) { idx in
                    Text(String(letters[idx]))
                        .font(.title)
                        .foregroundColor(.white)
                        .background(enabled ? randomColor() : Color.black)
                        .offset(dragOffset2)
                        .animation(Animation.default.delay(Double(idx / 20)))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { self.dragOffset2 = $0.translation }
                    .onEnded { _ in
                        self.dragOffset2 = .zero
                        self.enabled.toggle()
                    }
            )
        }
    }
}

struct AnimatingGestureView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingGestureView()
    }
}
