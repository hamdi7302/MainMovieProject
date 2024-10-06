//
//  MovieRQDTO.swift
//  MainMovieProject
//
//  Created by hamdi on 6/10/2024.
//

import Foundation


 


public struct MovieRSDTO: Codable {
    let id: Int
    let results: [Result]
}

// MARK: - Result
public struct Result: Codable {
    let name, key: String
    let site: String
    let size: Int
    let type: String
    let official: Bool
    let id: String
}
