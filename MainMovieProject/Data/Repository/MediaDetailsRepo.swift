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
    func addToWishList(mediaParams: WatchlistMovieDetailsDTO) -> AnyPublisher<Response, NetworkError>
    func asyncGetMediaPortal(imageString: String) -> AnyPublisher<UIImage?,NetworkError>
    func rateMedia(mediaId: Int, mediaRate: Int) -> AnyPublisher<Response,NetworkError>
}

class MediaDetailsRepoImpl: MediaDetailsRepo{
    func asyncGetMediaPortal(imageString: String) -> AnyPublisher<UIImage?, NetworkingPackage.NetworkError> {
        return MovieNetworkManager.shared.fetchImage(posterPath: imageString)
    }
    
    func setFavorie(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response, NetworkError> {
        return    MovieNetworkManager.shared.likeMedia(params: mediaParams.toDictionary())
    }

    func rateMedia(mediaId: Int, mediaRate: Int) -> AnyPublisher<Response,NetworkError> {
        return MovieNetworkManager.shared.rateMedia(queryParams: mediaId, params: ["value": mediaRate])
    }
    
    func addToWishList(mediaParams: WatchlistMovieDetailsDTO) -> AnyPublisher<Response, NetworkError> {
        return   MovieNetworkManager.shared.addToWishList(params: mediaParams.toDictionary())
    }
   
}
