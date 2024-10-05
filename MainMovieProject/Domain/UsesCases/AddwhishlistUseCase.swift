//
//  AddwhishlistUseCase.swift
//  MainMovieProject
//
//  Created by hamdi on 5/10/2024.
//

import Foundation
import Combine
import NetworkingPackage


protocol AddWishListUseCase {
    func execute(watchList: WatchlistMovieDetailsDTO) -> AnyPublisher<Response, NetworkError>
}

class AddWishListUseCaseImpl: AddWishListUseCase {
    
    private let ratingRepository: MediaDetailsRepo
    
    init(ratingRepository: MediaDetailsRepo) {
        self.ratingRepository = ratingRepository
    }
    
    func execute(watchList: WatchlistMovieDetailsDTO) -> AnyPublisher<Response, NetworkError> {
        return ratingRepository.addToWishList(mediaParams: watchList)
    }
}
