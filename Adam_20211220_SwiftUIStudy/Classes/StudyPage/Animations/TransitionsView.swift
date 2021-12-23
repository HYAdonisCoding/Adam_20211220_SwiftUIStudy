//
//  TransitionsView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/23.
//

import SwiftUI

struct TransitionsView: View {
    @State private var isShow = false
    var body: some View {
        //视图的显示隐藏动画--withAnimation+transition配合使用
        //若右侧画布没有效果，可将整个视图作为子视图放入ContentView中，并模拟器中运行
        
        VStack {
            Button("切换卡片卡片的显示和隐藏") {
                withAnimation {
                    self.isShow.toggle()
                }
                
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding(20)
            .background(randomColor())
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            if isShow {
                Rectangle()
                    .fill(randomColor())
                    .frame(width: 300, height: 200, alignment: .trailing)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .transition(
                        .asymmetric(
                            insertion: .scale,
                            removal: .opacity
                        )
                    )
            }
        }
    }
}

struct TransitionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionsView()
    }
}
