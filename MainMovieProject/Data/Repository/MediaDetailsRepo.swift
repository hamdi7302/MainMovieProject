//
//  MediaDetailsRepo.swift
//  MainMovieProject
//
//  Created by hamdi on 30/9/2024.
//

import Foundation
import NetworkingPackage
import Combine
import UIKit

protocol MediaDetailsRepo{
    func setFavorie(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response,NetworkError>
    func rating(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response,NetworkError>
    func addToWishlist(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response,NetworkError>
    func asyncGetMediaPortal(imageString: String) -> AnyPublisher<UIImage?,NetworkError>
}


class MediaDetailsRepoImpl: MediaDetailsRepo{
    func asyncGetMediaPortal(imageString: String) -> AnyPublisher<UIImage?, NetworkingPackage.NetworkError> {
        return MovieNetworkManager.shared.fetchImage(posterPath: imageString)
    }
    
    func addToWishlist(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response, NetworkError> {
        return MovieNetworkManager.shared.likeMedia(params: FavoriteMovieDetailsDTO(media_id: mediaParams.media_id , media_type: mediaParams.media_type, favorite: mediaParams.favorite).toDictionary())
    }
    
    
    func setFavorie(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response, NetworkError> {
        return    MovieNetworkManager.shared.likeMedia(params: FavoriteMovieDetailsDTO(media_id: mediaParams.media_id , media_type: mediaParams.media_type, favorite: mediaParams.favorite).toDictionary())
    }
    
    func rating(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response, NetworkError> {
        return MovieNetworkManager.shared.likeMedia(params: FavoriteMovieDetailsDTO(media_id: mediaParams.media_id , media_type: mediaParams.media_type, favorite: mediaParams.favorite).toDictionary())
    }
    
   
}
