//
//  Leftbuttons.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import SwiftUI

struct Leftbuttons: View {
    @ObservedObject  var leftbuttonsViewModel = LeftbuttonsViewModel()
    
    var body: some View {
        VStack {
            VStack(spacing: 15 ) {
                
                Button {
                    
                } label: {
                    Image(systemName: "info.circle.fill")
                        .foregroundStyle(Color.white)
                }
                
                Button {
                    leftbuttonsViewModel.favorie.toggle()
                } label: {
                    Image(systemName: leftbuttonsViewModel.favorie ?  "heart.fill" : "heart")
                        .foregroundStyle(Color.pink)
                    
                }
                Button {
                    leftbuttonsViewModel.rateTheMovie.toggle()
                } label: {
                    Image(systemName: leftbuttonsViewModel.rateTheMovie ? "star.fill" : "star")
                        .foregroundStyle(Color.yellow)
                }
                Button {
                    leftbuttonsViewModel.WishList.toggle()
                } label: {
                    Image(systemName: leftbuttonsViewModel.WishList ?  "bookmark.fill" : "bookmark")
                        .foregroundStyle(Color.teal)
                    
                }
            }
        }
    }
}


#Preview {
    Leftbuttons()
}


class LeftbuttonsViewModel: ObservableObject {
    @Published var showinfoDetails = false
    @Published var favorie = false
    @Published var rateTheMovie = false
    @Published var WishList = false
    
    init() {
    }
    
}
