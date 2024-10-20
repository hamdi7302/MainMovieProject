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
        NavigationStack {
            VStack(alignment:.leading){
                Text("Trending")
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .padding()
                ScrollView (showsIndicators: false) {
                    LazyVStack(spacing: 12 ){
                        ForEach(viewModel.mediaCardViewModels, id: \.card.id) { mediaViewModel in
                            MediaCard(viewModel: mediaViewModel)
                                .onTapGesture {
                                    withAnimation {
                                        viewModel.selectedMovieId = mediaViewModel.card.id
                                        mediaViewModel.showRatingview = false
                                        updateSelectedStates()
                                    }
                                }
                        }
                    }
                    .padding(.horizontal,30)
                }
                .navigationBarTitleDisplayMode(.inline)
            }
//            .navigationDestination(for: String.self) { string in
//                SearchableView()
//            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    ToolbarView()
                }
            }
           
        }
    }
}

//#Preview {
//    TrendingView()
//}
//







