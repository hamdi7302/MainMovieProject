//
//  ContentView.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import SwiftUI

struct TrendingView: View {
    @ObservedObject var viewModel: TrendingMoviesViewModel
    
    private func updateSelectedStates() {
        for index in viewModel.mediaCardViewModels.indices {
            viewModel.mediaCardViewModels[index].showActions = (viewModel.mediaCardViewModels[index].card.id == viewModel.selectedMovieId)
        }
    }
    
    var body: some View {
        
        ScrollView (showsIndicators: false) {
            LazyVStack(spacing: 12 ){
                ForEach(viewModel.mediaCardViewModels, id: \.card.id) { mediaViewModel in
                    MediaCard(viewModel: mediaViewModel) // Pass the individual view model
                        .onTapGesture {
                            withAnimation {
                                mediaViewModel.showRatingview = false
                                viewModel.selectedMovieId =  mediaViewModel.card.id
                                updateSelectedStates()
                            }
                        }
                }
            }
            .padding(.horizontal,30)
            .onAppear(perform: {
                withAnimation {
                    viewModel.fetchtrendingMovies()
                }
            })
        }
        
   
    }
}

//#Preview {
//    TrendingView()
//}
//







