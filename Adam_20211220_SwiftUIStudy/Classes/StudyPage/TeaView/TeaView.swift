//
//  TeaView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/27.
//

import SwiftUI

struct TeaView: View {
    @ObservedObject var order: Order = Order()
    
    var body: some View {
        Form {
            Section {
                Stepper("奶茶数量（10元/杯）：\(order.num)", value: $order.num, in: 1...20)
            }
            Section {
                Toggle(isOn: $order.specialRequest.animation()) {
                    Text("特殊需求")
                }
                if order.specialRequest {
                    Toggle(isOn: $order.isAddIce) {
                        Text("是否加冰")
                    }
                    Toggle(isOn: $order.isAddSugar) {
                        Text("是否加糖")
                    }
                }
            }
            Section {
                NavigationLink(destination: AddTeaAddressView(order: order)) {
                    Text("下一步（选择配送地址）")
                }
            }
        }
        .navigationBarTitle(Text("奶茶订单"), displayMode: .automatic)
    }
}

struct TeaView_Previews: PreviewProvider {
    static var previews: some View {
        TeaView()
    }
}
