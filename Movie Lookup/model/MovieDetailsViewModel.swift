//
//  MovieDetailsViewModel.swift
//  Movie Lookup
//
//  Created by Gary Bull on 12/01/2024.
//

import SwiftUI

@MainActor
class MovieDetailsViewModel: ObservableObject {
    
    @Published var credits: MovieCredits?
    @Published var cast: [MovieCredits.Cast] = []
    @Published var castProfiles: [CastProfile] = []
    
    func movieCredits(for movieID: Int) async {
            let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(MovieDBViewModel.apiKey)&language=en-US")!
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let credits = try JSONDecoder().decode(MovieCredits.self, from: data)
                self.credits = credits
                self.cast = (credits.cast?.sorted(by: {$0.order < $1.order}))!
            } catch {
                print(error.localizedDescription)
            }
    }
    
    func loadCastProfiles() async {
//        var profiles: [Int: CastProfile] = [:]()
        do {
            for member in cast {
                let url = URL(string: "https://api.themoviedb.org/3/person/\(member.id)?api_key=\(MovieDBViewModel.apiKey)&language=en-US")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let profile = try JSONDecoder().decode(CastProfile.self, from: data)
                castProfiles.append(profile)
//                castProfiles[member.order] = profile
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct CastProfile: Decodable, Identifiable {
    
    let birthdat: String?
    let id: Int
    let name: String
    let profile_path: String?
    
    var photoUrl: URL {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w200")
        return (baseURL?.appending(path: profile_path ?? ""))!
    }
}

struct MovieCredits: Decodable {
    let id: Int
    let cast: [Cast]?
    
    struct Cast: Decodable, Identifiable {
        let name: String?
        let id: Int
        let character: String
        let order: Int
    }
}
