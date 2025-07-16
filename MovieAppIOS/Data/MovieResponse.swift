//
//  MovieResponse.swift
//  MovieAppIOS
//
//  Created by Tardes on 16/7/25.
//

import Foundation

struct MovieResponse: Codable {
    let Search: [Movie]
}

struct Movie: Codable {
    let Title: String?
    let Year: String?
    let imdbID: String?
    let Poster: String
    let Plot: String?
    let Runtime: String?
    let Director: String?
    let Genre: String?
    let Country: String?
    
}
