//
//  Expenses.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/23.
//

import Foundation

struct Expense: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject{
    
    @Published var allExpenses: [Expense]{
        didSet{
            if let data = try? JSONEncoder().encode(allExpenses){
                UserDefaults.standard.set(data, forKey: "allExpenses")
            }
        }
    }
    
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "allExpenses"),
            let allExpenses = try? JSONDecoder().decode([Expense].self, from: data){
            self.allExpenses = allExpenses
            return
        }
        
        allExpenses = [
            Expense(name: "MacBook", type: "数码家电", amount: 15000),
            Expense(name: "Lebus的教程", type: "iOS学习", amount: 348)
        ]
        
    }
    
}
