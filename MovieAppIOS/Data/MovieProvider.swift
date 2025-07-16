//
//  MovieProvider.swift
//  MovieAppIOS
//
//  Created by Tardes on 16/7/25.
//

import Foundation

class MovieProvider {
    static let BASE_URL = "https://www.omdbapi.com/"
    static let ACCESS_TOKEN = "169a016e"
    
    static func findMovieByName(query: String) async -> [Movie] {
        
        guard let url = URL(string: "\(BASE_URL)?apikey=\(ACCESS_TOKEN)&s=\(query)") else {
            return []
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            /*if let str = String(data: data, encoding: .utf8) {
             print("Succesfully decoded: \(str)")
             }*/
            
            return try JSONDecoder().decode(MovieResponse.self, from: data).Search
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    
    static func findMovieById (id: String) async -> Movie? {
        let url = URL(string: "\(BASE_URL)?apikey=\(ACCESS_TOKEN)&i=\(id)")
        
        
        guard let url = url else {
            print("Error building URL")
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode(Movie.self, from: data)
            
            return result
        } catch {
            print(error)
            return nil
        }
    }
}
