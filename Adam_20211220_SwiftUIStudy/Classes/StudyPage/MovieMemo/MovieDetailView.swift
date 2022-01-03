//
//  MovieDetailView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/31.
//

import SwiftUI
import CoreData

struct MovieDetailView: View {
    let movie: Movie
    
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showAlert = false
    var body: some View {
        GeometryReader { geometryReader in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.movie.type ?? "喜剧")
//                        .renderingMode(.original)
                        .frame(maxWidth: geometryReader.size.width)
                        
                    Text(self.movie.type ?? "喜剧")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
//                        .offset(x: -5, y: -5)
                        .padding(8)
                }
                
                Text(self.movie.review ?? "没写点评").padding()
                
                RatingView(rating: .constant(Int(self.movie.rating)))
                
                Spacer()
            }
            
        }
        .navigationBarTitle(Text(movie.name ?? "无名"), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showAlert.toggle()
        }) {
            Image(systemName: "trash")
        })
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("删除电影"),
                message: Text("确认删除电影\(movie.name ?? "")吗？"),
                primaryButton: .destructive(Text("确认"), action: {
                self.deleteMovie()
            }),
                secondaryButton: .cancel(Text("取消")))
        }
    }
    
    func deleteMovie() {
        context.delete(movie)
        try? context.save()
        
        presentationMode.wrappedValue.dismiss()
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static let content = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let movie = Movie(context: content)
        movie.id = UUID()
        movie.name = "唐人街探案3"
        movie.type = "喜剧"
        movie.rating = 4
        movie.review = "非常搞笑的电影"
        return MovieDetailView(movie: movie)
    }
}
