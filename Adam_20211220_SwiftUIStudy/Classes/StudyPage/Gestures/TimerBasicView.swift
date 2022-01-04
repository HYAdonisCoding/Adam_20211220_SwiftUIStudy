//
//  TimerBasicView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import SwiftUI

struct TimerBasicView: View {
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //添加tolerance(容差值)提升App性能
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()

    @State private var counter = 0
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                    print("self.timer--cancel()")
                } else {
                    print(time)
                }
                
                self.counter += 1
            }
    }
}

struct TimerBasicView_Previews: PreviewProvider {
    static var previews: some View {
        TimerBasicView()
    }
}
