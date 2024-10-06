//
//  MovieCard.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import SwiftUI
import AVKit

struct MediaCard: View {
    
    @EnvironmentObject var genreDataModel: GenreDataModel
    @StateObject var viewModel: MediaCardViewModel
    @State private var scale: CGFloat = 1.0
    
    func getDescription() -> String{
        let  stringGneres: [String]  = viewModel.description.map { index in
            if (viewModel.card.mediaType == MediaType.movie.rawValue){
                
                return genreDataModel.movies.first(where: {$0.id == index})?.name ?? ""
            }else {
                return genreDataModel.tv.first(where: {$0.id == index})?.name ?? ""
            }
        }
        return stringGneres.joined(separator: ", ")
    }
    
    
    var body: some View{
        ZStack {
            if let image = viewModel.image {
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
                LinearGradient(gradient: Gradient(colors: [.gray, .white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Fills the available space
            }
            HStack{
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable( resizingMode: .stretch)
                        .imageScale(.large)
                    
                        .overlay {
                            if viewModel.showActions {
                                ZStack {
                                    Image(systemName: "play.circle")
                                        .resizable()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .scaleEffect(scale)
                                        .onAppear {
                                            withAnimation(
                                                Animation.smooth(duration: 1).repeatForever(autoreverses: true)
                                            ) {scale = 1.1}
                                        }.onTapGesture {
                                            viewModel.showVideo = true
                                        }
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.black.opacity(0.3)) // Add if you want to ensure it's filling all space
                                
                            }
                        }   .cornerRadius(12)
                    
                    
                }else {
                    Rectangle()
                        .foregroundStyle(Color.gray).overlay {
                            ProgressView()
                            
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            
                        }.cornerRadius(12)
                    
                }
                
                VStack{
                    Text(viewModel.title)
                        .font(.headline)
                    
                    Text(viewModel.card.overview)
                        .font(.callout)
                        .padding(.vertical)
                        .padding(.horizontal)
                    
                    HStack{
                        Text(viewModel.releaseDate)
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
            
        } .overlay(alignment: .trailing, content: {
            if viewModel.showActions {
                Leftbuttons(mediaCardViewModel: viewModel).offset(x:27)
            }
        })
        .onAppear(perform: {
            viewModel.executeFetchImage()
        })
        .onDisappear {
            viewModel.setImageToNil()
        }
        .sheet(isPresented: $viewModel.showVideo, content: {
        
            YouTubePlayer(videoID: viewModel.videoUrl ?? "")
            
            }
        )
    }
}

//    #Preview {
//        MediaCard(viewModel: MediaCardViewModel(resultCard: Movie(id: 12, originalTitle: "", overview: "", popularity: 10, realeaseDate: "", mediaType: "", genreids: [], posterPath: ""), isSelected: false))
//    }


