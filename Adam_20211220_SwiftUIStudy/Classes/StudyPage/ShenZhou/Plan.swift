//
//  Plan.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/23.
//

import Foundation

struct Plan: Codable,Identifiable{
    
    struct Member: Codable {
        let name: String
        let birth: String
    }
    
    let id: Int
    let name: String
    let launchDate: String
    let member: [Member]?
    let description: String
    let hasBadge: Bool
    
    var imageName: String{
        hasBadge ? "shenzhou\(id)" : "placeholder"
    }
}
