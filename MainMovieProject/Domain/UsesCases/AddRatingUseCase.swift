//
//  AddRatingUseCase.swift
//  MainMovieProject
//
//  Created by hamdi on 30/9/2024.
//

import Foundation
import Combine
import NetworkingPackage

protocol AddRatingUseCase {
    func execute (rateMovie: Int, mediaId: Int ) -> AnyPublisher<Response, NetworkError>
}

class AddRatingUseCaseImple: AddRatingUseCase {
    
    private let ratingRepository: MediaDetailsRepo
    
    init(favoritesRepository: MediaDetailsRepo) {
        self.ratingRepository = favoritesRepository
    }
    
    func execute(rateMovie: Int, mediaId: Int ) -> AnyPublisher<Response, NetworkError> {
        return ratingRepository.rateMedia(mediaId: mediaId, mediaRate: rateMovie)
    }
}
