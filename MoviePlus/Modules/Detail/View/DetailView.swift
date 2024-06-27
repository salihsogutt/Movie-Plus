//
//  DetailView.swift
//  MoviePlus
//
//  Created by salih söğüt on 26.06.2024.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    var movie: Movie
    var body: some View {
        VStack(alignment: .leading) {
                    
            
            KFImage(URL(string: NetworkCommon.imageBaseUrl + (movie.posterPath ?? "") ))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipped()
                .cornerRadius(10)
            
            Spacer()
                                
            VStack(alignment: .leading, spacing: 10) {
                Text("Movie")
                    .font(.headline)
                    .foregroundColor(Color("orange"))
                
                Text(movie.name ?? movie.title ?? "")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(movie.overview ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                                
                
                HStack {
                    Text("Popularity \(Int(movie.popularity ?? 0))")
                        .padding(5)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    
                    Text(movie.releaseDate ?? "")
                        .padding(5)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(Int(movie.voteAverage ?? 0))")
                    }
                    .padding(5)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                                        
                }
                .font(.caption)
                .foregroundColor(.white)
                
                Button(action: {
                    print("Watch Now button tapped")
                }) {
                    Text("Watch Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("orange"))
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .padding()
            .padding(.bottom, 60)
            .background(Color.black)
            .cornerRadius(10)
        }
        .background(Color.black)
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie(adult: false, backdropPath: "", genreIDS: [], id: 1, originalLanguage: "tr", originalTitle: "Title", overview: "overview", popularity: 100, posterPath: "https://picsum.photos/200/300", releaseDate: "01.01.2000", title: "normal title", video: false, voteAverage: 1, voteCount: 2, name: "Name"))
    }
}


