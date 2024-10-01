//
//  AddFavoriteUseCase.swift
//  MainMovieProject
//
//  Created by hamdi on 30/9/2024.
//

import Foundation
import Combine
import NetworkingPackage



protocol AddToFavoritesUseCase {
    func execute (movie: FavoriteMovieDetailsDTO) -> AnyPublisher<Response, NetworkError>
}

 
class AddToFavoritesUseCaseImpl: AddToFavoritesUseCase {
    
    private let favoritesRepository: MediaDetailsRepo
    
    init(favoritesRepository: MediaDetailsRepo) {
        self.favoritesRepository = favoritesRepository
    }
    
    func execute(movie: FavoriteMovieDetailsDTO) -> AnyPublisher<Response, NetworkError> {
        return favoritesRepository.setFavorie(mediaParams: movie)
    }
}
