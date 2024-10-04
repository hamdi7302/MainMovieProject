//
//  File.swift
//  MainMovieProject
//
//  Created by hamdi on 29/9/2024.
//

import Foundation
import NetworkingPackage
import SwiftUI
import Combine

struct UserInfo: Decodable {
    var username: String
    var email: String
    var password: String
}



public struct Genres: Decodable {
    public let genres: [Genre]
}

// MARK: - Genre
public struct Genre: Decodable {
    public let id: Int
    public let name: String
}

public enum GenreType: String {
    case tv
    case movie
}


public struct Response: Decodable  {
  var  success : Bool
}

protocol AppService {
    func fetchAllTrending (trendingType: TrendingTypeDTO) -> AnyPublisher<TrendingMoviesDTO,NetworkError>
    func fetchImage(posterPath : String) -> AnyPublisher <UIImage?,NetworkError>
    func fetchMoviesGenre(forMovie: GenreType) -> AnyPublisher<Genres,NetworkError>
}

public class MovieNetworkManager: AppService {
    
    static let shared : MovieNetworkManager = MovieNetworkManager()
    
    private let apiKey = "24a88a21ab7c3515e507d9ea64d8d878"
    
    private let networkManager: NetworkManager = NetworkManager()
    init() {
        
    }
  
    
    // inclsue as @EnvironmentObject  in Datamodel  with the type tv or movies
    public func fetchMoviesGenre(forMovie: GenreType) -> AnyPublisher<Genres,NetworkError> {
        var endoint = "https://api.themoviedb.org/3/genre/\(forMovie)/list"
        endoint.append("?api_key=\(apiKey)&language=en") // to remove and append header user session
        // to replace token with user token
        return networkManager.request(endoint: endoint)
    }
    
    public func fetchImage(posterPath: String) -> AnyPublisher <UIImage?,NetworkError> {
        let endoint = "https://image.tmdb.org/t/p/w1280\(posterPath)"
        // to remove and append header user session
        
        // to replace token with user token
        return networkManager.fetchAndCacheImage(endoint: endoint)
    }
    
    
  
    
     func fetchAllTrending(trendingType: TrendingTypeDTO) -> AnyPublisher<TrendingMoviesDTO, NetworkError> {
        
        var endoint = "https://api.themoviedb.org/3/trending/movie/\(trendingType)"
        endoint.append("?api_key=\(apiKey)") // to remove and append header user session
        
        // to replace token with user token
        return networkManager.request(endoint: endoint)
    }

    
    public func likeMedia(params: [String:Any] ) -> AnyPublisher<Response, NetworkError> {
        let account_id = "9090719"
        let endoint = "https://api.themoviedb.org/3/account/\(account_id)/favorite"
        //   endoint.append("?api_key=\(apiKey)" to remove and append header user session
        
        // this service is accesse in ly by seesion and not by api kry
        // to replace token with user token
        return networkManager.request(endoint: endoint,authmethod: .post, params: params)
    
    }
    
    public func rateMedia(queryParams: Int, params: [String:Any] ) -> AnyPublisher<Response, NetworkError> {
        let endoint = "https://api.themoviedb.org/3/movie/\(queryParams)/rating"
        return networkManager.request(endoint: endoint,authmethod: .post, params: params)
    
    }
    
}

 

