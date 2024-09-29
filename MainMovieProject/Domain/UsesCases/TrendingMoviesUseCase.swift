//
//  TrendingMoviesUseCase.swift
//  MainMovieProject
//
//  Created by hamdi on 29/9/2024.
//

import Foundation
import Combine
import NetworkingPackage


class GetTrendingUseCase {
    private let repository: TrendingMovieRerpository
    
    init(repository: TrendingMovieRerpository) {
        self.repository = repository
    }
    
    func execute(params:  TrendingTypeDTO) -> AnyPublisher<[Movie], NetworkError> {
        return repository.getTrendingMovies(trendingType: .day)
    }
}
