//
//  MovieCard.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import SwiftUI

struct MovieCard:  View {
    @ObservedObject var collpasedMovieCardViewModel: CollpasedMovieCardViewModel
    var body: some View{
        ZStack {
            if let image = collpasedMovieCardViewModel.image {
                Image(uiImage: image)
                    .resizable() // Allows the image to resize
                    .aspectRatio(1.5, contentMode: .fill)
                    .blur(radius: 25)
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
                        .multilineTextAlignment(.center)
                    Text(collpasedMovieCardViewModel.description)
                        .font(.subheadline)
                        .padding()
                    
                    HStack{
                        Text(collpasedMovieCardViewModel.releaseDate)
                            .font(.footnote)
                    }
                    
                    
                }.foregroundStyle(Color.black)
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
