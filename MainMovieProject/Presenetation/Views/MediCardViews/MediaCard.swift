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
                if !(viewModel.showVideo){
                    MediaImage(viewModel: viewModel)
                    MediaDetails(viewModel: viewModel)
                }else {
                    YouTubePlayer(videoID: viewModel.videoUrl ?? "")
                }
            }
            .aspectRatio(1.5, contentMode: .fit)
            .cornerRadius(12)
        }
        .overlay(alignment: .trailing) {
            if viewModel.showActions {
                LeftButtons(mediaCardViewModel: viewModel).offset(x:27)
            }
        }
        .overlay(alignment: .leading) {
            if viewModel.showActions {
                Image(systemName: "\(viewModel.index + 1).lane")
                        .resizable()
                        .frame(width: 30, height: 30)
                .offset(x: -40, y: 0)
            }
        }
   
        .onAppear(perform: {
            viewModel.executeFetchImage()
        })
        .onDisappear {
            viewModel.setImageToNil()
        }
    }
}


#Preview {
    MediaCard(viewModel: MediaCardViewModel(index: 1, resultCard: Movie(id: 12, originalTitle: "Sample Movie", overview: "A thrilling journey of adventure and discovery.", popularity: 8.5, realeaseDate: "2024-10-07", mediaType: MediaType.movie.rawValue, genreids: [], posterPath: "", vote_average: 10), isSelected: false, mediaRepository: MediaDetailsRepoImpl()))
}


