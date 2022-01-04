//
//  NotificationCenterView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import SwiftUI

struct NotificationCenterView: View {
    let center = NotificationCenter.default
    
    @State private var name = ""
    var body: some View {
        TextField("State", text: $name)
            .background(randomColor())
            .onReceive(center.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                self.name = "App退到后台了"
                print(self.name)
            }
            .onReceive(center.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                self.name = "App回到前台了"
                print(self.name)
            }
            .onReceive(center.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
                self.name = "用户截屏了"
                print(self.name)
            }
            .onReceive(center.publisher(for: UIResponder.keyboardDidShowNotification)) { _ in
                self.name = "软键盘出来了"
                print(self.name)
            }
    }
}

struct NotificationCenterView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCenterView()
    }
}
