//
//  AstronautView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/27.
//

import SwiftUI

struct AstronautView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    let name: String
    
    var astronaut: Astronaut {
        astronauts.first(where: { $0.name == self.name })!
    }
    
    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView(.vertical) {
                Image(self.astronaut.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometryProxy.size.width)
                
                Text(self.astronaut.description)
                    .padding()
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static var previews: some View {
        AstronautView(name: "翟志刚")
    }
}
