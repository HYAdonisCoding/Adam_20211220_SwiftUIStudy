//
//  MovieMemoView.swift
//  Adam_20211220_SwiftUIStudy
//
//  Created by Adam on 2021/12/30.
//

import SwiftUI

struct MovieMemoView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(entity: Movie.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Movie.rating, ascending: false)]
    ) var movies: FetchedResults<Movie>
    
    @State private var showSheet = false
    
    var body: some View {
        List {
            ForEach(movies, id: \.id) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    EmojiRatingView(rating: movie.rating)
                        .font(.largeTitle)
                    VStack(alignment: .leading) {
                        Text(movie.name ?? "").font(.headline)
                        Text(movie.type ?? "").foregroundColor(.secondary)
                    }
                }
            }
            .onDelete(perform: deleteMovies)
        }
        .navigationTitle("看过的电影")
        .navigationBarItems(
            leading: EditButton(),
            trailing: Button(action: {
                self.showSheet.toggle()
            }) {
                Image(systemName: "plus")
            })
        .sheet(isPresented: $showSheet) {
            AddMovieView().environment(\.managedObjectContext, context)
        }
    }
    
    
    func deleteMovies(indexSet: IndexSet) {
        for index in indexSet {
            context.delete(movies[index])
        }
        try? context.save()
    }
}

struct MovieMemoView_Previews: PreviewProvider {
    static var previews: some View {
        MovieMemoView()
    }
}
