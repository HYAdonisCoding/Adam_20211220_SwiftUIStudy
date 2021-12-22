//
//  GuessFlagView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/22.
//

import SwiftUI

struct GuessFlagView: View {
    @State private var countries = ["中国", "美国", "日本", "法国", "德国", "意大利", "俄罗斯", "英国"]
    @State private var currentCountry = Int.random(in: 0...2)
    
    @State private var showAlert = false
    
    @State private var alertTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.green, .blue]),
                startPoint: .top,
                endPoint: .bottom
            ).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    Text("以下国家的旗帜是哪一个")
                        .foregroundColor(.white)
                    Text(countries[currentCountry])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    
                }
                ForEach(0..<3) { idx in
                    Button(action: {
                        self.alertTitle = idx == self.currentCountry ? "恭喜你，答对了" : "答错了，继续努力"
                        self.showAlert = true
                    }, label: {
                        Image(self.countries[idx])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    })

                    
                }
                Spacer()
            }
            
        }.alert(isPresented: $showAlert) {
            Alert(
                title: Text(alertTitle),
                message: nil,
                dismissButton: .default(Text("继续")) {
                    self.next()
            })
        }
    }
    
    func next() {
        countries.shuffle()
        currentCountry = Int.random(in: 0...2)
    }
}

struct GuessFlagView_Previews: PreviewProvider {
    static var previews: some View {
        GuessFlagView()
    }
}
