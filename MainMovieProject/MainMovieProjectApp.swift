//
//  MainMovieProjectApp.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import SwiftUI


@main
struct MainMovieProjectApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject var genresDataModel = GenreDataModel()
    
    let trendingRepoImpl: TrendingMediaReposioryImpl
    let getTrendingUseCaseImpl: GetTrendingUseCaseImpl
    let trendingMoviesViewModel: TrendingMoviesViewModel
    let mediaRepository: MediaDetailsRepoImpl
    
    init() {
        trendingRepoImpl = TrendingMediaReposioryImpl()
        mediaRepository = MediaDetailsRepoImpl()
        getTrendingUseCaseImpl = GetTrendingUseCaseImpl(repository: trendingRepoImpl)
        trendingMoviesViewModel = TrendingMoviesViewModel(getTrendingUseCase: getTrendingUseCaseImpl, mediaRepository: mediaRepository)
    }
    
    var body: some Scene {
        
        WindowGroup {
            TrendingView(viewModel: trendingMoviesViewModel)
        }
        .environmentObject(genresDataModel)
    }
}


