//
//  MainView.swift
//  MainMovieProject
//
//  Created by hamdi on 7/10/2024.
//

import SwiftUI

enum NavigationDestinations: String, CaseIterable, Hashable {
    case details
}

struct MainView: View {
    let container: DIContainer
    @StateObject var trendingViewModel: TrendingMoviesViewModel

    init(container: DIContainer) {
        self.container = container
        _trendingViewModel = StateObject(wrappedValue: container.makeTrendingViewModel())
    }

    var body: some View {
        NavigationStack {
            VStack {
                TabView {
                    TrendingView(viewModel: trendingViewModel)
                        .tabItem {
                            Label("Trending", systemImage: "lasso.badge.sparkles")
                        }
                        .tag(0)
                    
                    PopularMoviesView(viewModel: trendingViewModel)
                        .tabItem {
                            Label("Popular", systemImage: "lasso")
                        }
                        .tag(1)
                    MoreView()
                        .tabItem {
                            Label("More", systemImage: "ellipsis")
                        }
                        .tag(3)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    ToolbarView()
                }
            }
            .navigationDestination(for: String.self) { string in
                SearchableView()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(container: DIContainer())
    }
}
