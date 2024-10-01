//
//  ContentView.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import SwiftUI

struct TrendingView: View {
    @StateObject var viewModel: TrendingMoviesViewModel

    var body: some View {
        
        TabView(selection: .constant(1),
                content:  {
            ScrollView (showsIndicators: false) {
                LazyVStack(spacing: 12 ){
                    ForEach(viewModel.movies, id: \.id) { movie in
                        MediaCard(viewModel: MediaCardViewModel(resultCard: movie, isSelected: viewModel.selectedMovieId == movie.id))
                         
                            .onTapGesture {
                                withAnimation {
                                    viewModel.selectedMovieId = movie.id
                                }
                            }
                    }
                }
                .padding(.horizontal,30)
                .onAppear(perform: {
                    withAnimation {
                        viewModel.fetchtrendingMovies()
                    }
                })
            }
             
            .tabItem {
                VStack{
                    Image(systemName: "lasso.badge.sparkles")
                    Text("Trending")
                } }.tag(1)
            Text("Popular").tabItem {
                VStack{
                    Image(systemName: "lasso") }.tag(2)
                Text("Popular")
            }
            Text("Search").tabItem {
                VStack{
                    Image(systemName: "magnifyingglass") }.tag(3)
                Text("Search")
            }
            
            Text("More").tabItem {
                VStack{
                    Image(systemName: "ellipsis") }.tag(4)
                Text("More")
            }
        })
    }
}

//#Preview {
//    TrendingView()
//}
//







