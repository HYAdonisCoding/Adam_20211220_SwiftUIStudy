//
//  AddTeaAddressView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/27.
//

import SwiftUI

struct AddTeaAddressView: View {
    @ObservedObject var order: Order

    var body: some View {
        Form {
            Section {
                TextField("姓名", text: $order.name)
                TextField("手机", text: $order.phone)
                    .keyboardType(.numberPad)
                TextField("地址", text: $order.address)
            }
            Section {
                NavigationLink(destination: CheckOutView(order: order)) {
                    Text("确认订单")
                }
                .disabled(order.hasInvalidAddress)
            }
        }
        .navigationBarTitle(Text("送达地址"), displayMode: .inline)
    }
}

struct AddAddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddAddressView()
    }
}
