//
//  MainMovieProjectApp.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import SwiftUI


@main
struct MainMovieProjectApp: App {
    
    @ObservedObject var genresDataModel = GenreDataModel()
    let repo = TrendingMediaReposioryImpl() 
    var body: some Scene {
        
        WindowGroup {
            TrendingView(viewModel: TrendingMoviesViewModel(trending: GetTrendingUseCase(repository: repo)))
        }
        .environmentObject(genresDataModel)
    }
}


