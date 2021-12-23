//
//  ExpensesView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/23.
//

import SwiftUI

struct ExpensesView: View {
    
    @State private var showSheet = false
    @ObservedObject var expenses = Expenses()
    
    var body: some View {
        List {
            ForEach(expenses.allExpenses) { e in
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(e.name).font(.headline)
                        Text(e.type)
                    }
                    Spacer()
                    
                    Text("\(e.amount)")
                }
            }
            .onDelete(perform: remove)
        }
        .navigationBarTitle("费用支出")
        .navigationBarItems(trailing:
            Button(
                action: {
                    self.showSheet = true
                    
                }) {
                    Image(systemName: "plus")
                }
            
        ).sheet(isPresented: $showSheet) {
            AddView(expenses: self.expenses)
        }

    }
    
    func remove(indexSet: IndexSet) {
        expenses.allExpenses.remove(atOffsets: indexSet)
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
