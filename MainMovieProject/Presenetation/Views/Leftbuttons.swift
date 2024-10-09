//
//  Leftbuttons.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//
import SwiftUI

struct LeftButtons: View {
    
    @ObservedObject var mediaCardViewModel: MediaCardViewModel
    

    
    var body: some View {
        VStack {
            VStack(spacing: 15) {
                InfoButton(mediaCardViewModel:  mediaCardViewModel)
                RateButton(mediaCardViewModel: mediaCardViewModel)
                FavoriteButton(mediaCardViewModel: mediaCardViewModel)
                RatingButton(mediaCardViewModel: mediaCardViewModel)
                WatchlistButton(mediaCardViewModel: mediaCardViewModel)
                buyRent(mediaCardViewModel: mediaCardViewModel)
            }
        }
        .onDisappear {
            mediaCardViewModel.showRatingview = false
        }
    }
}

// MARK: -

struct InfoButton: View {
    @ObservedObject var mediaCardViewModel: MediaCardViewModel
    
    var body: some View {
        Button {
            withAnimation {
                mediaCardViewModel.showRatingview = false
            }
        } label: {
            Image(systemName: "info.circle.fill")
                .foregroundStyle(Color.white)
        }
    }
}


struct RateButton: View {
    @ObservedObject var mediaCardViewModel: MediaCardViewModel
    var body: some View {
        Text(mediaCardViewModel.rate?.0 ?? "A+")
            .font(.caption)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .foregroundStyle(mediaCardViewModel.rate?.1 ?? .green)
    }
}

struct FavoriteButton: View {
    @ObservedObject var mediaCardViewModel: MediaCardViewModel
    
    var body: some View {
        Button {
            withAnimation {
                mediaCardViewModel.showRatingview = false
                mediaCardViewModel.favorie.toggle()
            }
        } label: {
            Image(systemName: mediaCardViewModel.favorie ? "heart.fill" : "heart")
                .foregroundStyle(Color.pink)
        }
    }
}

struct RatingButton: View {
    @ObservedObject var mediaCardViewModel: MediaCardViewModel
    
    var body: some View {
        Button {
            mediaCardViewModel.showRatingview = true
        } label: {
            Image(systemName: "star")
                .foregroundStyle(Color.yellow)
                .overlay {
                    GeometryReader { geo in
                        Rectangle()
                            .fill(Color.yellow)
                            .frame(width: geo.size.width / 5 * CGFloat(mediaCardViewModel.rating))
                            .mask(alignment: .leading) {
                                Image(systemName: "star.fill")
                            }
                    }
                }
        }
        .overlay(alignment: .trailing) {
            if mediaCardViewModel.showRatingview {
                ZStack {
                    RatingView(viewModel: mediaCardViewModel)
                        .offset(x: -25)
                }
            }
        }
    }
}

struct WatchlistButton: View {
    @ObservedObject var mediaCardViewModel: MediaCardViewModel
    
    var body: some View {
        Button {
            withAnimation {
                mediaCardViewModel.showRatingview = false
                mediaCardViewModel.watchList.toggle()
            }
        } label: {
            Image(systemName: mediaCardViewModel.watchList ? "bookmark.fill" : "bookmark")
                .foregroundStyle(Color.teal)
        }
    }
}

struct buyRent: View {
    @ObservedObject var mediaCardViewModel: MediaCardViewModel
    
    var body: some View {
        Button {
            withAnimation {
                //                mediaCardViewModel.showRatingview = false
                //                mediaCardViewModel.watchList.toggle()
            }
        } label: {
            Image(systemName: "cart")
                .foregroundStyle(Color.white)
        }
    }
}





#Preview {
    ZStack {
        HStack {
            Spacer()
            Color.gray
            LeftButtons(mediaCardViewModel: MediaCardViewModel(index: 3, resultCard: Movie(id: 123, originalTitle: "John WXick", overview: "description", popularity: 99, realeaseDate: "19/2/2025", mediaType: "movie", genreids: [], posterPath: "", vote_average: 10), isSelected: true, mediaRepository: MediaDetailsRepoImpl()))
        }
    }
}
