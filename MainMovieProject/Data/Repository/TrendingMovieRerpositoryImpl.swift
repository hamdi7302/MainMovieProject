//
//  TrendingMovieRerpositoryImpl.swift
//  MainMovieProject
//
//  Created by hamdi on 29/9/2024.
//

import Foundation
import NetworkingPackage
import Combine

struct TrendingMovieReposioryImpl: TrendingMovieRerpository {
  
    func getTrendingMovies(trendingType: TrendingTypeDTO) -> AnyPublisher<[Movie],NetworkError> {
        MovieNetworkManager.shared.fetchAllTrending(trendingType: .day)
            .map{MovieMapper.converttoEntity(moviesDTO: $0.results)}
            .eraseToAnyPublisher()

    }
    
 
}
