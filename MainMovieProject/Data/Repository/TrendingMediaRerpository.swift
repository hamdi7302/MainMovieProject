//
//  TrendingMovieRerpository.swift
//  MainMovieProject
//
//  Created by hamdi on 29/9/2024.
//

import Foundation
import NetworkingPackage
import Combine


protocol TrendingMediaRerpository {
    func getTrendingMedia(trendingType: TrendingTypeDTO) -> AnyPublisher<[Movie], NetworkError>
}
