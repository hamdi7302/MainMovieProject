//
//  GenreDataModel.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import Foundation
import Combine
import NetworkingPackage

class GenreDataModel: ObservableObject {
    
    let networkManager = MovieNetworkManager()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var movies: [Genre] = []
    
    init() {
        networkManager.fetchMoviesGenre(forMovie: .tv)
            .map { $0.genres }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] genres in
                self?.movies = genres
            })
            .store(in: &cancellables)
    }
}
