//
//  TrendingMoviesUseCase.swift
//  MainMovieProject
//
//  Created by hamdi on 29/9/2024.
//

import Foundation
import Combine
import NetworkingPackage

protocol GetTrendingUseCase {
    func execute(params:  TrendingTypeDTO) -> AnyPublisher<[Movie], NetworkError>
}

class GetTrendingUseCaseImpl: GetTrendingUseCase {
   
    private let repository: TrendingMediaRerpository
    
    init(repository: TrendingMediaRerpository) {
        self.repository = repository
    }
    
    func execute(params: TrendingTypeDTO) -> AnyPublisher<[Movie],NetworkError> {
        return repository.getTrendingMedia(trendingType: .week)
    }
 
}
