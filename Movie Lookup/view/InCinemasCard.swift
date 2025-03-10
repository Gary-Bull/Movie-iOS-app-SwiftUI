//
//  InCinemasCard.swift
//  Movie Lookup
//
//  Created by Gary Bull on 20/11/2023.
//

import Foundation
import SwiftUI

struct InCinemasCard: View {
    
    let inCinemasItem: Movie
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: inCinemasItem.posterPathURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 260, height: 400, alignment: .center)
            } placeholder: {
                    Rectangle().fill(Color(red: 61/255,green: 61/255,blue: 88/255))
                        .frame(width: 260, height: 350)
            }
            
            VStack {
                HStack {
                    Text(inCinemasItem.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", inCinemasItem.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            .padding()
            .background(Color(red: 61/255,green: 61/255,blue: 88/255))
            .frame(width: 260)
        }
        .cornerRadius(10)
    }
}
