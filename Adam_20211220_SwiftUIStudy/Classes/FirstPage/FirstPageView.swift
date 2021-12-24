//
//  FirstPageView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/21.
//

import SwiftUI

struct FirstPageView: View {
    private var data = [FirstPageModel("Actual Combat",
                                       [FirstPageDataModel(page: ExpensesView(), title: "ExpensesView", subTitle:""),
                                        FirstPageDataModel(page: ShenZhouView(), title: "ShenZhouView", subTitle:""),
                                       ]),
                        FirstPageModel("Animation",
                                       [FirstPageDataModel(page: BaseAnimationView(), title: "BaseAnimationView", subTitle:"Implicit animation"),
                                        FirstPageDataModel(page: AnimatingBindingsView(), title: "AnimatingBindingsView"),
                                        FirstPageDataModel(page: ExplictAnimationsView(), title: "ExplictAnimationsView"),
                                        FirstPageDataModel(page: MultipleImplicitAnimationView(), title: "MultipleImplicitAnimationView"),
                                        FirstPageDataModel(page: AnimatingGestureView(), title: "AnimatingGestureView"),
                                        FirstPageDataModel(page: TransitionsView(), title: "TransitionsView"),
                                       ]),
                        FirstPageModel("Form",
                                       [FirstPageDataModel(page: AddAddressView(), title: "AddAddressView", subTitle:"Add recipient information, test form"),
                                       ]),
                        FirstPageModel("View layout",
                                       [FirstPageDataModel(page: GuessFlagView(), title: "GuessFlagView", subTitle: "Guess the flag game"),
                                        FirstPageDataModel(page: AboutModifierView(), title: "AboutModifierView"),
                                       ])
                    ]
    
    /// 点击触发push时的key
    @State var pushKey = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.indices) { section in
                    let s = data[section]
                    Section(s.sectionTitle) {
                        ForEach(s.datas.indices) { idx in
                            let m = s.datas[idx]
                            FirstPageTCell(m.page, m.title, m.subTitle)
                            
                        }
                    }
                    
                    
                }
            }
            .listStyle(.plain)
            .navigationTitle(Text("Home"))
        }
        
    }
}

struct FirstPageView_Previews: PreviewProvider {
    static var previews: some View {
        FirstPageView()
    }
}

//model
struct FirstPageModel: Identifiable {
    var id = UUID()
    var sectionTitle: String
    var datas: [FirstPageDataModel]
    init(_ sectionTitle: String, _ datas: [FirstPageDataModel]) {
        self.sectionTitle = sectionTitle
        self.datas = datas
    }
}
struct FirstPageDataModel: Identifiable {
    var id = UUID()
    var page: Any
    var title: String
    var subTitle: String = ""
}
