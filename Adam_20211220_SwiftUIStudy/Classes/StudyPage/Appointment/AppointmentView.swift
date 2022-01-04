//
//  AppointmentView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import SwiftUI

extension View {
    func stacked(index: Int, count: Int) -> some View {
        self.offset(x: 0, y: CGFloat(count - index) * 10)
    }
}

struct AppointmentView: View {
    @State private var cards = cardsFromJSON
    @State private var timeRemain = 100
    @State private var isActive = true
    
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .pink, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 8) {
                Text("剩余时间:\(timeRemain)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(Color.black)
                            .opacity(0.75)
                    )
                ZStack(alignment: .center) {
                    ForEach(cards.indices, id: \.self) { idx in
                        CardView(card: self.cards[idx]) {
                            self.removeCard(idx)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .stacked(index: idx, count: self.cards.count)
                        .allowsHitTesting(idx == self.cards.count - 1)
                    }
                    .allowsHitTesting(timeRemain > 0)
                    
                    if cards.isEmpty {
                        Button("再来一次", action: resetCards)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                    }
                }
            }
        }
        .onReceive(timer) { _ in
            guard self.isActive else {
                return
            }
            if self.timeRemain > 0 {
                self.timeRemain -= 1
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            if !self.cards.isEmpty { self.isActive = true }
        }
    }
    
    func removeCard(_ idx: Int) {
        cards.remove(at: idx)
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func resetCards() {
        cards = cardsFromJSON
        timeRemain = 100
        isActive = true
    }
}

struct AppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentView()
    }
}
