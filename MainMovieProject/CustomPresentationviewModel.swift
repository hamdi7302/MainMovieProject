//
//  PreventationViewModel.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import NetworkingPackage
import Combine
import Foundation

class CustomPresentationviewModel: ObservableObject {
    
    let movieNetworkManger = MovieNetworkManager()
    @Published var movies: [ResultCard] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchTrendingMovies()
    }
    
    
    func fetchTrendingMovies() {
        
        movieNetworkManger.fetchAllTrending(trendingType: .day)
            .receive(on: DispatchQueue.main)
            .sink { response in
                
                print("success")
                
            } receiveValue: { [self] result  in
                
                self.movies = result.results
                
            }.store(in: &cancellables)
    }
}

