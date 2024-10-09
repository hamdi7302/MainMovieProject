//
//  TrendingMovieMapper.swift
//  MainMovieProject
//
//  Created by hamdi on 29/9/2024.
//

import Foundation

struct MovieMapper {
    
    static func converttoEntity(moviesDTO: [AllResultDTO]) -> [Movie] {
        return  moviesDTO.map{convertmovieDTOtoEntity(moviesDTO: $0)}
        
    }
    
    static func convertmovieDTOtoEntity(moviesDTO: AllResultDTO) -> Movie {
        Movie(id: moviesDTO.id,
              originalTitle: moviesDTO.originalTitle,
              overview: moviesDTO.overview,
              popularity: moviesDTO.popularity,
              realeaseDate: moviesDTO.releaseDate,
              mediaType: convertMediaType(media: moviesDTO.mediaType).rawValue,
              genreids: moviesDTO.genreIDS,
              posterPath: moviesDTO.posterPath, 
              vote_average: moviesDTO.voteAverage)
        
    }
    
    static func convertMediaType (media: MediaTypeDTO) -> MediaType{
        return MediaType(rawValue: media.rawValue) ?? .movie
    }
}
