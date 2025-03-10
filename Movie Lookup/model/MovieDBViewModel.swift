//
//  MovieDBViewModel.swift
//  Movie Lookup
//
//  Created by Gary Bull on 17/11/2023.
//

import Foundation

@MainActor
class MovieDBViewModel: ObservableObject {
    
    @Published var trending: [Movie] = []
    @Published var inCinemas: [Movie] = []
    @Published var popular: [Movie] = []
    @Published var searchResults: [Movie] = []
    
    static let apiKey = "4367d80ae6635b1c87a7cc73474da9ce"
    
    func loadTrending() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?&language=en-US&page=1&api_key=\(MovieDBViewModel.apiKey)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(TrendingResults.self, from: data)
                trending = trendingResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func loadInCinemas() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?&language=en-US&page=1&api_key=\(MovieDBViewModel.apiKey)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let inCinemasResults = try JSONDecoder().decode(InCinemasResults.self, from: data)
                inCinemas = inCinemasResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func loadPopular() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/movie/popular?&language=en-US&page=1&sort_by=popularity.desc&api_key=\(MovieDBViewModel.apiKey)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let popularResults = try JSONDecoder().decode(PopularResults.self, from: data)
                popular = popularResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func search(term: String) {
        Task {
            let url = URL(string:
                "https://api.themoviedb.org/3/search/movie?api_key=\(MovieDBViewModel.apiKey)&language=en-US&page=1&include_adult=false&query=\(term)".addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)!
                
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults = try JSONDecoder().decode(TrendingResults.self, from: data)
                searchResults = trendingResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}


