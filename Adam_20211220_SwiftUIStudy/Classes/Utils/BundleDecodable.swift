//
//  BundleDecodable.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = Bundle.main.url(forResource: file, withExtension: nil),
              let data = try? Data(contentsOf: url),
              let loaded = try? JSONDecoder().decode(T.self, from: data)
        else { fatalError("没有取到数据") }
        return loaded
    }
}
