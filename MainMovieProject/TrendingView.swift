//
//  ContentView.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import SwiftUI

struct TrendingView: View {
    @StateObject var customPresentationviewModel =  CustomPresentationviewModel()
    
    
    
    var body: some View {
        
        TabView(selection: .constant(1),
                content:  {
            ScrollView (showsIndicators: false) {
                LazyVStack(spacing: 12 ){
                    ForEach(customPresentationviewModel.movies, id: \.id) { movie in
                        MovieCard( collpasedMovieCardViewModel: CollpasedMovieCardViewModel(resultCard: movie))
                            .overlay(alignment: .trailing, content: {
                                if movie.id == customPresentationviewModel.selectedMovieId {
                                    Leftbuttons().offset(x:27)
                                }
                            })
                            .overlay {
                                ZStack(alignment: .topTrailing){
                                    Color.clear
                                    Image(systemName: "").padding()
                                        .foregroundColor(.white)
                                    
                                }
                                
                            }
                            .onTapGesture {
                                withAnimation {
                                    customPresentationviewModel.selectedMovieId = movie.id
                                }
                            }
                    }
                }
                .padding(.horizontal,30)
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

#Preview {
    TrendingView()
}








