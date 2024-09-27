//
//  MovieCard.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import SwiftUI

struct MovieCard:  View {
    @EnvironmentObject var genreDataModel: GenreDataModel
    @ObservedObject var collpasedMovieCardViewModel: CollpasedMovieCardViewModel
    
    func getDescription() -> String{
        let  stringGneres: [String]  = collpasedMovieCardViewModel.description.map { index in
            if (collpasedMovieCardViewModel.card.mediaType == .movie){
                
                return genreDataModel.movies.first(where: {$0.id == index})?.name ?? ""
            }else {
                return genreDataModel.tv.first(where: {$0.id == index})?.name ?? ""
            }
        }
        return stringGneres.joined(separator: ", ")
    }
    
    
    var body: some View{
        ZStack {
            if let image = collpasedMovieCardViewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .blur(radius: 25)
                    .aspectRatio(1.5, contentMode: .fill)
                    .overlay(
                        Color.white.opacity(0.2)
                    )
                    .cornerRadius(12)
                 
                // Clips to bounds
            } else {
                LinearGradient(gradient: Gradient(colors: [.orange, .white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Fills the available space
            }
            HStack{
                if let image = collpasedMovieCardViewModel.image {
                    Image(uiImage: image)
                        .resizable( resizingMode: .stretch)
                        .imageScale(.large)
                        .cornerRadius(12)
                }else {
                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                }
                
                VStack{
                    Text(collpasedMovieCardViewModel.title)
                        .font(.headline)
                    
                    Text(collpasedMovieCardViewModel.card.overview)
                        .font(.callout)
                        .padding(.vertical)
                        .padding(.horizontal)
                    
                    HStack{
                        Text(collpasedMovieCardViewModel.releaseDate)
                            .font(.caption)
                    }
                }
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.black)
                .multilineTextAlignment(.center)
                .padding(.vertical)
                
                
            }
            
            .aspectRatio(1.5, contentMode: .fit)
            .cornerRadius(12)
            
        }
    }
}

//    #Preview {
//        MovieCard(collpasedMovieCardViewModel: <#T##CollpasedMovieCardViewModel#>)
//    }
