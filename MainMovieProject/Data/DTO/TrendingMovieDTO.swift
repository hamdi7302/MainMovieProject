//
//  TrendingMoviesDTO.swift
//  MainMovieProject
//
//  Created by hamdi on 29/9/2024.
//

import Foundation

// MARK: - Welcome
 struct TrendingMoviesDTO: Codable {
    let page: Int
     let results: [AllResultDTO]
    let totalPages, totalResults: Int

     enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
 struct AllResultDTO: Codable, Hashable {
     let backdropPath: String
     let id: Int
     let title, originalTitle, overview, posterPath: String
     let mediaType: MediaTypeDTO
    let adult: Bool
    let originalLanguage: String
     let genreIDS: [Int]
    let popularity: Double
     let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

     enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id, title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case adult
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

 enum MediaTypeDTO: String, Codable {
    case movie = "movie"
    case tv = "tv"
}



struct FavoriteMovieDetailsDTO: Codable {
     init(media_id: Int, media_type: MediaTypeDTO, favorite: Bool) {
        self.media_id = media_id
        self.media_type = media_type
        self.favorite = favorite
    }
    var media_id: Int
    var media_type: MediaTypeDTO
    var favorite: Bool
}

extension FavoriteMovieDetailsDTO {
    func toDictionary() -> [String: Any] {
        return [
            "media_id": media_id,
            "media_type": media_type.rawValue,
            "favorite": favorite
        ]
    }
}

public enum TrendingTypeDTO: String {
    case day
    case week
}


