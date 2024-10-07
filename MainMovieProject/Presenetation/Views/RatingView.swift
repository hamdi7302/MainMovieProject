//
//  RatingView.swift
//  MainMovieProject
//
//  Created by hamdi on 4/10/2024.
//

import SwiftUI

struct RatingView: View {
    
    @ObservedObject var viewModel: MediaCardViewModel
    @State var rating: Int =  0
    
    private var starsView: some View {
        HStack{
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut, {
                            rating = index
                            viewModel.rating = index
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75, execute: {
                                viewModel.showRatingview = false
                            })
                            
                        })
                    }
            }
        }
    }
    
    private var starViewMask: some View {
        GeometryReader(content: { geometry in
            Rectangle()
                .fill(Color.yellow)
                .frame(width: geometry.size.width / 5 * CGFloat(rating))
                .mask(alignment: .leading) {
                    starsView
                }
        }).allowsHitTesting(false)
    }
    
    var body: some View {
        starsView.overlay {
            starViewMask
        }.padding()
            .background(Color.black.opacity(0.7).blur(radius: 3.0))
        .clipShape(RoundedRectangle(cornerRadius: 12.0))
    }
}


#Preview {
    ZStack{
        Color.cyan.ignoresSafeArea()
        RatingView(viewModel: MediaCardViewModel(resultCard: Movie(id: 123, originalTitle: "John WXick", overview: "desciptin ", popularity: 99, realeaseDate: "19/2/2025", mediaType: "movie", genreids: [], posterPath: ""), isSelected: true, mediaRepository: MediaDetailsRepoImpl()))
             
    }
}
