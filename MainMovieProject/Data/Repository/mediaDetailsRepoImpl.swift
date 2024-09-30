//
//  mediaDetailsRepoImpl.swift
//  MainMovieProject
//
//  Created by hamdi on 30/9/2024.
//

import Foundation
import Combine
import NetworkingPackage

class MediaDetailsRepoImpl: MediaDetailsRepo{
    
    func likeUnlike(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response,NetworkError> {
        return    MovieNetworkManager.shared.likeMedia(params: FavoriteMovieDetailsDTO(media_id: mediaParams.media_id , media_type: mediaParams.media_type, favorite: mediaParams.favorite).toDictionary())
    }
    
    func rating(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response,NetworkError> {
        return MovieNetworkManager.shared.likeMedia(params: FavoriteMovieDetailsDTO(media_id: mediaParams.media_id , media_type: mediaParams.media_type, favorite: mediaParams.favorite).toDictionary())
    }
}
