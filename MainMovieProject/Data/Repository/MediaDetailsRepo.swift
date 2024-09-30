//
//  MediaDetailsRepo.swift
//  MainMovieProject
//
//  Created by hamdi on 30/9/2024.
//

import Foundation
import NetworkingPackage
import Combine

protocol MediaDetailsRepo{
    func likeUnlike(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response,NetworkError>
    func rating(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response,NetworkError>
    func addToWishlist(mediaParams: FavoriteMovieDetailsDTO) -> AnyPublisher<Response,NetworkError>
    }
