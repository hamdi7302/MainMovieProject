//
//  File.swift
//  MainMovieProject
//
//  Created by hamdi on 7/10/2024.
//

import Foundation
import SwiftUI

struct MediaDetails: View {
    @ObservedObject var viewModel: MediaCardViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.headline)
            
            Text(viewModel.card.overview)
                .font(.callout)
                .padding(.vertical)
                .padding(.horizontal)
            
            HStack {
                Text(viewModel.releaseDate)
                    .font(.caption)
            }
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .foregroundStyle(Color.black)
        .padding(.vertical)
       
    }
}

#Preview {
    MediaDetails(viewModel: MediaCardViewModel(index: 2, resultCard: Movie(id: 12, originalTitle: "Movie Title", overview: "This is a test overview for the movie.", popularity: 10, realeaseDate: "2023-01-01", mediaType: "movie", genreids: [], posterPath: "", vote_average: 10), isSelected: false, mediaRepository: MediaDetailsRepoImpl()))
}
