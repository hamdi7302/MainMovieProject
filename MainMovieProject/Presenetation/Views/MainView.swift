//
//  MainView.swift
//  MainMovieProject
//
//  Created by hamdi on 7/10/2024.
//

import SwiftUI

struct MainView: View {
    
    let trendingRepoImpl: TrendingMediaReposioryImpl
    let getTrendingUseCaseImpl: GetTrendingUseCaseImpl
    let trendingMoviesViewModel: TrendingMoviesViewModel
    let mediaRepository: MediaDetailsRepoImpl
    
    @State var selection: Int = 0
    
    init() {
        trendingRepoImpl = TrendingMediaReposioryImpl()
        mediaRepository = MediaDetailsRepoImpl()
        getTrendingUseCaseImpl = GetTrendingUseCaseImpl(repository: trendingRepoImpl)
        trendingMoviesViewModel = TrendingMoviesViewModel(getTrendingUseCase: getTrendingUseCaseImpl, mediaRepository: mediaRepository)
    }
    
    var body: some View {
        NavigationView {  // Wrap in NavigationView to help manage state
            TabView(selection: $selection) {
                TrendingView(viewModel: trendingMoviesViewModel)
                    .tabItem {
                        VStack{
                            Image(systemName: "lasso.badge.sparkles")
                            Text("Trending")
                        }
                    }
                    .tag(1)
                Text("Popular").tabItem {
                    VStack{
                        Image(systemName: "lasso")
                        Text("Popular")
                    }
                }.tag(0)
                Text("Search").tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }.tag(2)
                
                Text("More").tabItem {
                    VStack{
                        Image(systemName: "ellipsis")
                        Text("More")
                    }
                }.tag(3)
            }
        }
    }
}

#Preview {
    MainView()
}
