//
//  FetchTrailersUseCase.swift
//  MainMovieProject
//
//  Created by hamdi on 6/10/2024.
//

import Foundation
import Combine
import NetworkingPackage

protocol FetchTrailersUseCase {
    func execute(fechTrailerFor mediaId : Int) -> AnyPublisher<MovieRSDTO, NetworkError>
}

class FetchTrailersUseCaseImpl: FetchTrailersUseCase{
    
    
    var fetchTrailersRepo: MediaDetailsRepo
    
    init(fetchTrailersRepo: MediaDetailsRepo) {
        self.fetchTrailersRepo = fetchTrailersRepo
    }
    
    func execute(fechTrailerFor mediaId : Int) -> AnyPublisher<MovieRSDTO, NetworkError> {
        fetchTrailersRepo.fetchMediaTrailers(mediaId: mediaId)
    }
}
