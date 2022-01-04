//
//  FirstPageView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/21.
//

import SwiftUI
import UIKit

class NavigationAction: ObservableObject {
   @Published var backToRoot: Bool = false
}

struct FirstPageView: View {
    @Environment(\.managedObjectContext) var context

//    @EnvironmentObject var action: NavigationAction
    @State var action: NavigationAction = NavigationAction()
    
    private var data = [
        FirstPageModel("Actual Combat",
                       [FirstPageDataModel(page: NotificationCenterView(), title: "NotificationCenter", subTitle:""),
                        FirstPageDataModel(page: TimerBasicView(), title: "TimerBasic", subTitle:""),
                        FirstPageDataModel(page: GesturesFeatureView(), title: "GesturesFeature", subTitle:""),
                        FirstPageDataModel(page: GesturesBasicView(), title: "GesturesBasic", subTitle:""),
                        FirstPageDataModel(page: ExpensesView(), title: "ExpensesView", subTitle:""),
                        
                        FirstPageDataModel(page: ShenZhouView(), title: "ShenZhouView", subTitle:""),
                        FirstPageDataModel(page: TeaView(), title: "TeaView", subTitle:""),
                        FirstPageDataModel(page: GetAPIData(), title: "GetAPIData From Apple", subTitle:"Need Scientific Internet access"),
                        FirstPageDataModel(page: ContactView(), title: "ContactView", subTitle:""),
                       ]
                      ),
        FirstPageModel("About UIKit",
                       [FirstPageDataModel(page: AEControllerPage<AEFirstViewController>(), title: "UIKitController", subTitle:"Open UIKit  UIViewController"),
                        FirstPageDataModel(page: AEWebView(), title: "WebViewPage", subTitle:"Open WebView"),
                        FirstPageDataModel(page: UploadImageView(), title: "UploadImageView", subTitle:""),
                        FirstPageDataModel(page: MapView(), title: "MapView", subTitle:""),
                       ]
                      ),
        FirstPageModel("About CoreData",
                       [FirstPageDataModel(page: MovieMemoView(), title: "MovieMemoView", subTitle:""),
                        FirstPageDataModel(page: AttributesDefaultValueView(), title: "AttributesDefaultValueView", subTitle:""),
                        FirstPageDataModel(page: HasChangesAndConstraintsView(), title: "HasChangesAndConstraintsView", subTitle:""),
                        
                        FirstPageDataModel(page: NSPredicateView(), title: "NSPredicateView", subTitle:""),
                        FirstPageDataModel(page: RelationshipsView(), title: "RelationshipsView", subTitle:""),
                       ]
                      ),
        
        
        FirstPageModel("Animation",
                       [FirstPageDataModel(page: BaseAnimationView(), title: "BaseAnimationView", subTitle:"Implicit animation"),
                        FirstPageDataModel(page: AnimatingBindingsView(), title: "AnimatingBindingsView"),
                        FirstPageDataModel(page: ExplictAnimationsView(), title: "ExplictAnimationsView"),
                        FirstPageDataModel(page: MultipleImplicitAnimationView(), title: "MultipleImplicitAnimationView"),
                        FirstPageDataModel(page: AnimatingGestureView(), title: "AnimatingGestureView"),
                        FirstPageDataModel(page: TransitionsView(), title: "TransitionsView"),
                       ]
                      ),
        FirstPageModel("Form",
                       [FirstPageDataModel(page: AddAddressView(), title: "AddAddressView", subTitle:"Add recipient information, test form"),
                       ]
                      ),
        FirstPageModel("View layout",
                       [FirstPageDataModel(page: GuessFlagView(), title: "GuessFlagView", subTitle: "Guess the flag game"),
                        FirstPageDataModel(page: AboutModifierView(), title: "AboutModifierView"),
                       ]
                      )
    ]
    
    /// 点击触发push时的key
    @State var pushKey = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.indices) { section in
                    let s = data[section]
                    Section(header: Text(s.sectionTitle)) {
                        ForEach(s.datas.indices) { idx in
                            let m = s.datas[idx]
                            FirstPageTCell(m.page, m.title, m.subTitle)
                                .environment(\.managedObjectContext, self.context)
                            
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
