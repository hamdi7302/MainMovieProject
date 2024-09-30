//
//  File.swift
//  MainMovieProject
//
//  Created by hamdi on 29/9/2024.
//

import Foundation
import Combine


class TrendingMoviesViewModel: ObservableObject{
    private let repository = TrendingMediaReposioryImpl()
    private let getTrandingmovieUseCase: GetTrendingUseCase
    private var cancellables = Set<AnyCancellable>()
    @Published var selectedMovieId: Int?
    @Published var movies: [Movie] = []
    
    init(trending: GetTrendingUseCase) {
        self.getTrandingmovieUseCase = trending
    }
    
    func fetchtrendingMovies ()  {
        getTrandingmovieUseCase.execute(params: .day)
            .receive(on: DispatchQueue.main) // Ensure UI updates happen on the main thread
            .sink { completion in
                switch completion {
                case .failure(let error): break
                    //                       self.errorMessage = error.localizedDescription
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
