//
//  AddMovieView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/31.
//

import SwiftUI

struct AddMovieView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode

    @State private var name = ""
    @State private var typeIndex = 2
    @State private var rating = 3
    @State private var review = ""
    
    let types = ["科幻", "恐怖", "喜剧", "动画", "剧情", "爱情", "悬疑"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("电影名", text: $name)
                    Picker("类型", selection: $typeIndex) {
                        ForEach(types.indices) {
                            Text(self.types[$0])
                        }
                    }
                }
                Section {
                    RatingView(rating: $rating)
                    TextField("点评", text: $review)
                }
                Section {
                    Button("提交") {
                        let newMovie = Movie(context: self.context)
                        newMovie.id = UUID()
                        newMovie.name = self.name
                        newMovie.type = self.types[self.typeIndex]
                        newMovie.rating = Int16(self.rating)
                        newMovie.review = self.review
                        
                        try? self.context.save()
                        
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }
                }
            }
            .navigationBarTitle(Text("新增电影"), displayMode: .inline)
//            .navigationBarHidden(true)
        }
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
    }
}
