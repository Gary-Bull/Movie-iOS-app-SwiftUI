//
//  PopularCard.swift
//  Movie Lookup
//
//  Created by Gary Bull on 20/11/2023.
//

import Foundation
import SwiftUI

struct PopularCard: View {
    
    let popularItem: Movie
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: popularItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 340, height: 250, alignment: .center)
            } placeholder: {
                    Rectangle().fill(Color(red: 61/255,green: 61/255,blue: 88/255))
                        .frame(width: 340, height: 250)
            }
            
            VStack {
                HStack {
                    Text(popularItem.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", popularItem.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            .padding()
            .background(Color(red: 61/255,green: 61/255,blue: 88/255))
            .frame(width: 340)
        }
        .cornerRadius(10)
    }
}
