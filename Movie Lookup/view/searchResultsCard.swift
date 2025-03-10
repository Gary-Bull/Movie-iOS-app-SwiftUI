//
//  searchResultsCard.swift
//  Movie Lookup
//
//  Created by Gary Bull on 03/01/2024.
//

import Foundation
import SwiftUI

struct searchResultsCard: View {
    
    let searchResultsItem: Movie
    
    var body: some View {
        HStack {
            AsyncImage(url: searchResultsItem.posterPathURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 120)
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 120)
            }
            .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(searchResultsItem.title)
                    .foregroundColor(.white)
                    .font(.headline)
                
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", searchResultsItem.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            Spacer()
            
        }
        .padding()
        .background(Color(red: 61/255,green: 61/255,blue: 88/255))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

