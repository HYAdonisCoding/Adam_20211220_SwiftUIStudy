//
//  AboutModifierView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/22.
//

import SwiftUI

struct AboutModifierView: View {
    
    @State private var changeColor = false
    let a = Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    
    @State private var content = ""
    var textfield: some View {
        TextField("z", text: $content)
    }
    
    
    var body: some View {
        List {
            
            a
                .frame(width: 200, height: 150, alignment: .center)
                .background(randomColor())
            
            a
                .background(randomColor())
                .frame(width: 200, height: 150, alignment: .center)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
                .background(randomColor())
                .padding()
                .background(randomColor())
                .padding()
                .background(randomColor())
            
            Button("Change color") {
                changeColor .toggle()
            }
            .frame(width: 200, height: 150, alignment: .center)            .padding()
            .background(changeColor ? randomColor() : Color.white)
            if changeColor {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .frame(width: 200, height: 150, alignment: .center)
            } else {
                Text("Hello, Adam!")
                    .frame(width: 200, height: 150, alignment: .center)
                    .font(.headline)
            }
            
            CapsuleText(title: "Subview 1")
                .padding(2)
            CapsuleText(title: "Subview 2")
                .padding(5)
            
            Text("Custom Modifier")
                .modifier(Title())
            
            Text("Custom Modifier1")
                .titleStytle()
                .foregroundColor(.white)
                .padding()
                .background(randomColor())
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text("Custom Modifier2")
                .frame(width: 200, height: 150, alignment: .center)
                .watermark("Adam")
                .foregroundColor(.white)
                .background(randomColor())
        }
        .font(.largeTitle)
        .navigationTitle("Modifier")
    }
}

// MARK: - 自定义修饰符 -- 大标题
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
    }
    
    
}

// MARK: - 自定义修饰符 -- 水印
struct Watermark: ViewModifier {
    let title: String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            
            content
            Text(title)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
    
}


extension View {
    func titleStytle() -> some View {
        self.modifier(Title())
    }
    func watermark(_ title: String) -> some View {
        self.modifier(Watermark(title: title))
    }
}

struct CapsuleText: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(randomColor())
            .clipShape(Capsule())
    }
}

struct AboutModifierView_Previews: PreviewProvider {
    static var previews: some View {
        AboutModifierView()
    }
}
