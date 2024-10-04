//
//  Leftbuttons.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import SwiftUI

struct Leftbuttons: View {
//    @ObservedObject  var viewModel = LeftbuttonsViewModel()
    @ObservedObject var mediaCardViewModel: MediaCardViewModel
    
    @State var showinfoDetails = false
    @State var favorie = false
    @State var rateTheMovie = false
    @State var WishList = false
    
    var body: some View {
        VStack {
            VStack(spacing: 15 ) {
                
                Button {
                 
                } label: {
                    Image(systemName: "info.circle.fill")
                        .foregroundStyle(Color.white)
                }
                
                Button {
                    favorie.toggle()
                    mediaCardViewModel.setFavorite(favorie)
                } label: {
                    Image(systemName: favorie ?  "heart.fill" : "heart")
                        .foregroundStyle(Color.pink)
                    
                }
                
                Button {
                    rateTheMovie.toggle()
                } label: {
                    Image(systemName: rateTheMovie ? "star.fill" : "star")
                        .foregroundStyle(Color.yellow)
                }.overlay (alignment: .trailing){
                    rateTheMovie ?
                    ZStack{
                        RatingView(viewModel: mediaCardViewModel)
                            .offset(x: -25)
                    }
                    
                    : nil
                }
                
                Button {
                    WishList.toggle()
                } label: {
                    Image(systemName: WishList ?  "bookmark.fill" : "bookmark")
                        .foregroundStyle(Color.teal)
                    
                }
            }
        }
    }
}


#Preview {
    ZStack{
        HStack{
            Spacer()
            Color.gray
            Leftbuttons( mediaCardViewModel: MediaCardViewModel(resultCard: Movie(id: 123, originalTitle: "John WXick", overview: "desciptin ", popularity: 99, realeaseDate: "19/2/2025", mediaType: "movie", genreids: [], posterPath: ""), isSelected: true, mediaRepository: MediaDetailsRepoImpl()))
        }
    }
}

 
