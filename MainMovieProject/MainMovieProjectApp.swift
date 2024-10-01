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
    
    let repo: TrendingMediaReposioryImpl
    let getTrendingUseCase: GetTrendingUseCaseImpl
    let trendingMoviesViewModel: TrendingMoviesViewModel
    
    init() {
        repo = TrendingMediaReposioryImpl()
        getTrendingUseCase = GetTrendingUseCaseImpl(repository: repo)
        trendingMoviesViewModel = TrendingMoviesViewModel(getTrendingUseCase: getTrendingUseCase)
    }
    
    var body: some Scene {
        
        WindowGroup {
//            TrendingView(viewModel: trendingMoviesViewModel)
            TestScreen()
        }
//        .environmentObject(genresDataModel)
    }
}


