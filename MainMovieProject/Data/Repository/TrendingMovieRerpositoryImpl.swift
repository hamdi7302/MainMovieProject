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
        MovieNetworkManager().fetchAllTrending(trendingType: .day) 
            .map{MovieMapper.converttoEntity(moviesDTO: $0.results)}
            .eraseToAnyPublisher()

    }
    
    func likeUnlike(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response, NetworkingPackage.NetworkError> {
        return MovieNetworkManager().likeMedia(params: FavoriteMovieDetailsDTO(media_id: mediaParams.media_id , media_type: mediaParams.media_type, favorite: mediaParams.favorite).toDictionary())
    }
}
