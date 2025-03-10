//
//  inCinemasResults.swift
//  Movie Lookup
//
//  Created by Gary Bull on 20/11/2023.
//

import Foundation

struct InCinemasResults: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
