//
//  GesturesBasicView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import SwiftUI

struct GesturesBasicView: View {
    @State private var currentAmount: CGFloat = 1
    @State private var currentAngle: Angle = .degrees(0)
    @State private var offset: CGSize = .zero
    @State private var longpressed = false
    
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                self.offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    self.offset = .zero
                    self.longpressed = false
                }
            }
        
        let longPressGesture = LongPressGesture()
            .onEnded { _ in
                withAnimation {
                    self.longpressed = true
                }
            }
        
        return VStack(spacing: 16) {
            Text("轻触手势")
                .font(.largeTitle)
                .padding()
                .background(randomColor())
                .onTapGesture(count: 2) {
                    print("XXXXXXX")
                }
                
            Text("长按手势")
                .font(.largeTitle)
                .padding()
                .background(randomColor())
                .onLongPressGesture(
                    minimumDuration: 4,
                    pressing: { isPressing in
                        //正在按--true；中途松开或者结束--false
                        print(isPressing)
                    }) {
                        print("yyyyyy")
                    }

            Text("捏合手势")
                .font(.largeTitle)
                .padding()
                .background(randomColor())
                .scaleEffect(currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged{ amount in
                            self.currentAmount = amount
                        }
                        .onEnded({ amount in
                            self.currentAmount = 1
                        })
                )
            
            Text("旋转手势")
                .font(.largeTitle)
                .padding()
                .background(randomColor())
                .rotationEffect(currentAngle)
                .gesture(
                    RotationGesture()
                        .onChanged({ angle in
                            self.currentAngle = angle
                        })
                        .onEnded({ _ in
                            self.currentAngle = .degrees(0)
                        })
                )
            //父视图优先（默认子视图优先）
            VStack {
                Text("父视图优先")
                    .font(.largeTitle)
                    .padding()
                    .background(randomColor())
                    .onTapGesture {
                        print("子视图被点击了")
                    }
            }
            .highPriorityGesture(
                TapGesture()
                    .onEnded({ _ in
                print("父视图被点击了")
            }))
            
            
            //父子视图都触发
            VStack {
                Text("父子视图都触发")
                    .font(.largeTitle)
                    .padding()
                    .background(randomColor())
                    .onTapGesture {
                        print("子视图被点击了")
                    }
            }
            .simultaneousGesture(
                TapGesture()
                    .onEnded({ _ in
                print("父视图被点击了")
            }))
            
            // 组合手势
            Circle()
                .fill(randomColor())
                .frame(width: 60, height: 60)
                .scaleEffect(longpressed ? 1.5 : 1)
                .offset(offset)
                .gesture(longPressGesture.sequenced(before: dragGesture))
        }
        
    }
}

struct GesturesBasicView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesBasicView()
    }
}
