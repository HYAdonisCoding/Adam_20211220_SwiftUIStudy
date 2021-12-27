//
//  GetAPIData.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/27.
//

import SwiftUI

struct Response: Codable {
    struct Result: Codable {
        let trackId: Int
        let collectionName: String
        let trackName: String
    }
    
    let results: [Result]
}

struct GetAPIData: View {
    @State private var results: [Response.Result] = []
    
    var body: some View {
        List(results, id: \.trackId) { result in
            VStack(alignment: .leading) {
                Text(result.trackName).font(.headline)
                Text(result.collectionName)
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else { return }
        //最基本的发送GET请求的用法
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                    let decodedData = try? JSONDecoder().decode(Response.self, from: data)
            else {
                return
            }
            DispatchQueue.main.async {
                self.results = decodedData.results
            }
        }
    }
}


struct GetAPIData_Previews: PreviewProvider {
    static var previews: some View {
        GetAPIData()
    }
}
