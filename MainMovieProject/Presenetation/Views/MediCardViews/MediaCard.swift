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
    
    var body: some View {
        ZStack {
            BackgroundImage(image: viewModel.image)
            
            HStack {
                MediaImage(viewModel: viewModel, scale: $scale)
                
                MediaDetails(viewModel: viewModel)
            }
            .aspectRatio(1.5, contentMode: .fit)
            .cornerRadius(12)
        }
        .overlay(alignment: .trailing) {
            if viewModel.showActions {
                LeftButtons(mediaCardViewModel: viewModel).offset(x:27)
            }
        }
        .onAppear(perform: {
            viewModel.executeFetchImage()
        })
        .onDisappear {
            viewModel.setImageToNil()
        }
        .fullScreenCover(isPresented: $viewModel.showVideo, content: {
            YouTubePlayer(videoID: viewModel.videoUrl ?? "").ignoresSafeArea()
        })
    }
}


#Preview {
    MediaCard(viewModel: MediaCardViewModel(resultCard: Movie(id: 12, originalTitle: "Sample Movie", overview: "A thrilling journey of adventure and discovery.", popularity: 8.5, realeaseDate: "2024-10-07", mediaType: MediaType.movie.rawValue, genreids: [], posterPath: ""), isSelected: false, mediaRepository: MediaDetailsRepoImpl()))
}


