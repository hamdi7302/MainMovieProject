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

    var body: some Scene {
        
        WindowGroup {
            MainView()
        }
        .environmentObject(genresDataModel)
    }
}


