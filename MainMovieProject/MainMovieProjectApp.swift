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
    var body: some Scene {
        WindowGroup {
            TrendingView()
        }
        .environmentObject(genresDataModel)
    }
}


