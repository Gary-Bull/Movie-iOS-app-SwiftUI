//
//  TrendingResults.swift
//  Movie Lookup
//
//  Created by Gary Bull on 17/11/2023.
//

import Foundation

struct TrendingResults: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
