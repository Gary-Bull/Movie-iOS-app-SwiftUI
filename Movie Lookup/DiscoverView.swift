//
//  DiscoverView.swift
//  Movie Lookup
//
//  Created by Gary Bull on 17/11/2023.
//

import SwiftUI

struct DiscoverView: View {
    
    @StateObject var viewModel = MovieDBViewModel()
    
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if searchText.isEmpty {
                    if viewModel.trending.isEmpty {
                        Text("No Results")
                            .background(Color(red: 39/255,green: 40/255,blue: 59/255))
                    } else {
                        HStack{
                            Text("Trending")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.trending) { trendingItem in
                                    NavigationLink {
                                        MovieDetailView(movie: trendingItem)
                                    } label: {
                                        TrendingCard(trendingItem: trendingItem)
                                            
                                    }
                                    
                                }
                            }
                            .padding()
                            .scrollTargetLayout()
                        }
                        .padding(.bottom)
                        .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
                        
                        HStack{
                            Text("Popular")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.popular) { popularItem in
                                    NavigationLink {
                                        MovieDetailView(movie: popularItem)
                                    } label: {
                                        PopularCard(popularItem: popularItem)
                                    }
                                }
                            }
                            .padding()
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
                        
                        HStack{
                            Text("In Cinemas Now")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.inCinemas) { inCinemasItem in
                                    NavigationLink {
                                        MovieDetailView(movie: inCinemasItem)
                                    } label: {
                                        InCinemasCard(inCinemasItem: inCinemasItem)
                                            .scrollTransition{ effect, phase in
                                                effect
                                                    .scaleEffect(phase.isIdentity ? 1 : 0.6)
                                                    .blur(radius: phase.isIdentity ? 0 : 6)
                                            }
                                    }
                                    
                                }
                            }
                            .padding()
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
                    }
                } else {
                    LazyVStack{
                        ForEach(viewModel.searchResults) { searchResultsItem in
                            NavigationLink {
                                MovieDetailView(movie: searchResultsItem)
                            } label: {
                                searchResultsCard(searchResultsItem: searchResultsItem)
                            }
                            
                        }
                    }
                    
                }
            }
            .searchable(text: $searchText)
			.onChange(of: searchText) { oldValue, newValue in
				if newValue.count > 2 {
					viewModel.search(term: newValue)
				}
			}
            .background(Color(red: 39/255,green: 40/255,blue: 59/255).ignoresSafeArea())
            .onAppear {
                viewModel.loadTrending()
                viewModel.loadInCinemas()
                viewModel.loadPopular()
            }
        }
        
    }
}


//#Preview {
//    DiscoverView()
//}

