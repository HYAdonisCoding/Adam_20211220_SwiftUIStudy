//
//  Coder.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import Foundation

class Coder: Identifiable, Codable {
    let id = UUID()
    var name = ""
    var phone = ""
    fileprivate(set) var isApple = true
}

class Coders: ObservableObject {
    static let allCodersKey = "allCoders"
    @Published private(set) var allCoders: [Coder] = []
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Self.allCodersKey),
           let allCoders = try? JSONDecoder().decode([Coder].self, from: data)
        {
            self.allCoders = allCoders
        }
    }
    
    func toggle(_ coder: Coder) {
        objectWillChange.send()
        coder.isApple.toggle()
        save()
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(allCoders) {
            UserDefaults.standard.set(data, forKey: Self.allCodersKey)
        }
    }
}
