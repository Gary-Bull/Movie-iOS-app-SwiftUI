//
//  TrendingItem.swift
//  Movie Lookup
//
//  Created by Gary Bull on 17/11/2023.
//

import Foundation

struct Movie: Identifiable, Decodable {
    
    let adult: Bool
    let id: Int
    let poster_path: String?
    let original_title: String
    let title: String
    let overview: String
    let vote_average: Float
    let backdrop_path: String?
    
    var backdropURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: backdrop_path ?? "")
    }
    
    var posterPathURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: poster_path ?? "")
    }
}
