//
//  Leftbuttons.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import SwiftUI

struct Leftbuttons: View {
    @ObservedObject  var viewModel = LeftbuttonsViewModel()
    @ObservedObject var mediaCardViewModel: MediaCardViewModel
    @State var favorite : Bool = false // to get initial state from another api
    var body: some View {
        VStack {
            VStack(spacing: 15 ) {
                
                Button {
                 
                } label: {
                    Image(systemName: "info.circle.fill")
                        .foregroundStyle(Color.white)
                }
                
                Button {
                    viewModel.favorie.toggle()
                    mediaCardViewModel.setFavorite(viewModel.favorie)
                } label: {
                    Image(systemName: viewModel.favorie ?  "heart.fill" : "heart")
                        .foregroundStyle(Color.pink)
                    
                }
                Button {
                    viewModel.rateTheMovie.toggle()
                } label: {
                    Image(systemName: viewModel.rateTheMovie ? "star.fill" : "star")
                        .foregroundStyle(Color.yellow)
                }
                Button {
                    viewModel.WishList.toggle()
                } label: {
                    Image(systemName: viewModel.WishList ?  "bookmark.fill" : "bookmark")
                        .foregroundStyle(Color.teal)
                    
                }
            }
        }
    }
}

//
//#Preview {
//    Leftbuttons()
//}


class LeftbuttonsViewModel: ObservableObject {
    @Published var showinfoDetails = false
    @Published var favorie = false
    @Published var rateTheMovie = false
    @Published var WishList = false
    
    init() {
    }
    
}
