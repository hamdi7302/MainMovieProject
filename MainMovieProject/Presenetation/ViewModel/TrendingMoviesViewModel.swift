//
//  File.swift
//  MainMovieProject
//
//  Created by hamdi on 29/9/2024.
//

import Foundation
import Combine


class TrendingMoviesViewModel: ObservableObject{
    private let getTrendingUseCase: GetTrendingUseCase
    private var cancellables = Set<AnyCancellable>()
    @Published var selectedMovieId: Int? = nil
    @Published var movies: [Movie] = []
    
    init( getTrendingUseCase: GetTrendingUseCase) {
        self.getTrendingUseCase = getTrendingUseCase
    }
    
    func fetchtrendingMovies () {
        getTrendingUseCase.execute(params: .day)
            .receive(on: DispatchQueue.main) // Ensure UI updates happen on the main thread
            .sink { completion in
                switch completion {
                case .failure(_): break
                    //  self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            } receiveValue: { movies in
                self.movies = movies
                self.selectedMovieId = movies.first?.id ?? 0
            }
            .store(in: &cancellables)
    }

}
