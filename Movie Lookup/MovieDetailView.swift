//
//  MovieDetailView.swift
//  Movie Lookup
//
//  Created by Gary Bull on 07/12/2023.
//

import SwiftUI

struct MovieDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var model = MovieDetailsViewModel()
    let movie: Movie
    let headerHeight: CGFloat = 400
    
    var body: some View {
        ZStack {
            Color(red: 39/255,green: 40/255,blue: 59/255).ignoresSafeArea()
            
            
                GeometryReader { geo in
                    VStack {
                        AsyncImage(url: movie.backdropURL) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: geo.size.width, maxHeight: headerHeight)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .ignoresSafeArea()
//                    .zIndex(1)
                
            
                ScrollView{
                    VStack(spacing: 12) {
                        Spacer()
                            .frame(height: headerHeight)

                            HStack {
                                Text(movie.title)
                                    .font(.title)
                                    .fontWeight(.heavy)
                                Spacer()
                                // ratings here
                            }
                        HStack {
                            // genre tags
                            
                        }
                        
                        HStack {
                            Text("About Film")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                            // see all button
                        }
                            
                        Text(movie.overview)
                            .lineLimit(2)
                            .foregroundColor(.secondary)
                        
                        HStack {
                            Text("Cast & Crew")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                            // see all button
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack{
                                ForEach(model.castProfiles) { cast in
                                    CastView(cast: cast)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .ignoresSafeArea()
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .fontWeight(.bold)
            }
            .padding(.leading)
        }
        .toolbar(.hidden, for: .navigationBar)
        .foregroundStyle(Color(.white))
        .task {
            await model.movieCredits(for: movie.id)
            await model.loadCastProfiles()
        }
        
    }
}

struct CastView: View {
    
    let cast: CastProfile

    var body: some View {
        VStack {
            
            AsyncImage(url: cast.photoUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 120)
            }
            Text(cast.name)
                .lineLimit(1)
                .frame(width: 100)
        }
    }
}
