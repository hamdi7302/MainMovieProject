//
//  ContentView.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import SwiftUI

struct TrendingView: View {
    @ObservedObject var customPresentationviewModel =  CustomPresentationviewModel()
    
    @State private var selectedMovieId: Int = 1
    
    var body: some View {
        
        TabView(selection: .constant(1),
                content:  {
            ScrollView (showsIndicators: false) {
                LazyVStack(spacing: 12 ){
                    ForEach(customPresentationviewModel.movies, id: \.id) { movie in
                        MovieCard( collpasedMovieCardViewModel: CollpasedMovieCardViewModel(resultCard: movie))
                            .onTapGesture {
                                selectedMovieId = movie.id
                            }
                            .overlay(alignment: .trailing, content: {
                                if movie.id == selectedMovieId {
                                    
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
                    }
                }
                .padding(.horizontal,30)
            }
            .tabItem { Image(systemName: "lasso.badge.sparkles") }.tag(1)
            Text("Popular").tabItem { Image(systemName: "lasso") }.tag(2)
            Text("Settings").tabItem { Image(systemName: "list.bullet.rectangle.fill") }.tag(2)
            Text("Settings").tabItem { Image(systemName: "gearshape.fill") }.tag(2)
        })
    }
}

#Preview {
    TrendingView()
}








