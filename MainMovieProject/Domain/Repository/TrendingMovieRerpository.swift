//
//  TrendingMovieRerpository.swift
//  MainMovieProject
//
//  Created by hamdi on 29/9/2024.
//

import Foundation
import NetworkingPackage
import Combine


protocol TrendingMovieRerpository {
    func getTrendingMovies(trendingType: TrendingTypeDTO) -> AnyPublisher<[Movie], NetworkError>
    func likeUnlike(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response,NetworkError>
}
