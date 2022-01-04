//
//  Card.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2022/1/4.
//

import Foundation


struct Card {
    let question: String
    let answer: Bool
}

let cardsFromJSON: [Card] = [
    Card(question: "棉花糖里有棉花吗", answer: false),
    Card(question: "夫妻肺片里有夫妻吗", answer: false),
    Card(question: "珍珠奶茶里有珍珠吗", answer: false),
    Card(question: "老婆饼里有老婆吗", answer: false),
    Card(question: "鱼香肉丝有鱼吗", answer: false)
]
