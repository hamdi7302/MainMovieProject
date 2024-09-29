//
//  MovieEntity.swift
//  MainMovieProject
//
//  Created by hamdi on 29/9/2024.
//

import Foundation

struct Movies {
    let movies: [Movie]
}

struct Movie {
    let id: Int
    let originalTitle: String
    let overview: String
    let popularity: Double
    let realeaseDate: String
    let mediaType: String
    let genreids: [Int]
    let posterPath: String
}

enum MediaType: String {
    case movie = "movie"
    case tv = "tv"
}
