//
//  GesturesFeatureView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import SwiftUI

struct GesturesFeatureView: View {
    var body: some View {
        VStack {
            Text("禁用手势")
                .font(.largeTitle)
                .padding()
                .background(randomColor())
                .onTapGesture {
                    print("XXX")
                }
                .allowsHitTesting(false)
            
            //使用contentShape让透明背景可被手势
            ZStack {
                Rectangle()
                    .fill(randomColor())
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("矩形被点击了")
                    }
                
                Circle()
                    .fill(randomColor())
                    .frame(width: 300, height: 300)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        print("圆形被点击了")
                    }
            }
            //使用contentShape让Spacer可被手势
            VStack {
                Text("hello")

                Spacer().frame(height: 100)
                Text("Adam")
            }
            .padding()
            .contentShape(Rectangle())
            .onTapGesture {
                print("VStack被点击了")

            }
            
        }
    }
}

struct GesturesFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesFeatureView()
    }
}
