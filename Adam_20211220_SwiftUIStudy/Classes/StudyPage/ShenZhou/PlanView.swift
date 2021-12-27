//
//  PlanView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/23.
//

import SwiftUI

struct PlanView: View {
    let plan: Plan
    
    var body: some View {
        GeometryReader { geometryProxy in
            ScrollView(.vertical) {
                VStack {
                    Image(self.plan.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometryProxy.size.width * 0.7)
                        .padding(.top)
                    
                    Text(self.plan.description)
                        .padding()
                    
                    if self.plan.member != nil {
                        ForEach(self.plan.member!, id: \.name) { member in
                            NavigationLink(
                                destination: AstronautView(name: member.name)
                            )
                            {
                                HStack {
                                    Image(member.name)
//                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 83, height: 60)
                                        .clipShape(Capsule())
                                        .overlay(
                                            Capsule()
                                                .stroke(
                                                    Color.primary,
                                                    lineWidth: 1
                                                )
                                        )
                                    VStack(alignment: .leading) {
                                        Text(member.name)
                                            .font(.headline)
                                        Text(member.birth)
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    Spacer(minLength: 25)
                    
                }
            }
        }
        .navigationBarTitle(Text(plan.name), displayMode: .inline)
    }
}

struct PlanView_Previews: PreviewProvider {
    static let plans: [Plan] = Bundle.main.decode("plans.json")
    
    static var previews: some View {
        PlanView(plan: plans[6])
    }
}
