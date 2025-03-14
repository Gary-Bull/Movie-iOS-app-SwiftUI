//
//  TrendingCard.swift
//  Movie Lookup
//
//  Created by Gary Bull on 17/11/2023.
//

import Foundation
import SwiftUI

struct TrendingCard: View {
    
    let trendingItem: Movie
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: trendingItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 300, alignment: .center)
            } placeholder: {
                    Rectangle().fill(Color(red: 61/255,green: 61/255,blue: 88/255))
                        .frame(width: 350, height: 300)
            }
            
            VStack {
                HStack {
                    Text(trendingItem.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", trendingItem.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            .padding()
            .background(Color(red: 61/255,green: 61/255,blue: 88/255))
            .frame(width: 350)
        }
        .cornerRadius(10)
    }
}
