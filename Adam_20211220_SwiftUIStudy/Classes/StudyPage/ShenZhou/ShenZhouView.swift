//
//  ShenZhouView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/23.
//

import SwiftUI

struct ShenZhouView: View {
    let plans: [Plan] = Bundle.main.decode("plans.json")

    var body: some View {
//        NavigationView {
            List(plans) { plan in
                NavigationLink(destination: PlanView(plan: plan)) {
                    Image(plan.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(plan.name).font(.headline)
                        Text(plan.launchDate)
                    }
                }
            }
            .navigationBarTitle("神舟任务")
//        }
    }
}

struct ShenZhouView_Previews: PreviewProvider {
    static var previews: some View {
        ShenZhouView()
    }
}
