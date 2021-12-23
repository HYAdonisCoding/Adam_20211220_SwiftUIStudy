//
//  AddView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/23.
//

import SwiftUI

struct AddView: View {
    static let types = ["生活用品", "数码家电", "服装", "学习"]
    
    @State private var name = ""
    @State private var type = 0
    @State private var amount = ""
    
    @ObservedObject var expenses: Expenses
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            
            Form {
                TextField("支出名称", text: $name)
                Picker("种类", selection: $type) {
                    ForEach(Self.types.indices) {
                        Text(Self.types[$0])
                    }
                }
                
                TextField("花费", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("添加支出")
            .navigationBarItems(trailing: Button("保存", action: {
                self.expenses.allExpenses.append(
                    Expense(
                        name: self.name,
                        type: Self.types[self.type],
                        amount: Int(self.amount)!
                    )
                )
                self.presentationMode.wrappedValue.dismiss()
            }))
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
