//
//  File.swift
//  MainMovieProject
//
//  Created by hamdi on 29/9/2024.
//

import Foundation
import Combine
import SwiftUI



class TrendingMoviesViewModel: ObservableObject{
    private let getTrendingUseCase: GetTrendingUseCase
    private var cancellables = Set<AnyCancellable>()
    
    @Published var selectedMovieId: Int? = nil
   
    @Published var mediaCardViewModels: [MediaCardViewModel] = []
    
    var mediaRepository: MediaDetailsRepoImpl
    
    init(getTrendingUseCase: GetTrendingUseCase, mediaRepository: MediaDetailsRepoImpl) { // to inject the test here
        self.getTrendingUseCase = getTrendingUseCase
        self.mediaRepository = MediaDetailsRepoImpl()
        fetchtrendingMovies()
//        removeNotSelectedmovies()
    }
//    func removeNotSelectedmovies () {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5 , execute: { [self] in
//            withAnimation {
//                 mediaCardViewModels.removeAll(where: {$0.card.id != selectedMovieId})
//            }
//        })
//       
//    }
     func updateSelectedStates() {
            for index in mediaCardViewModels.indices {
                mediaCardViewModels[index].showActions = (mediaCardViewModels[index].card.id == selectedMovieId)
            }
        }
    
    func fetchtrendingMovies () {
        getTrendingUseCase.execute(params: .day)
            .receive(on: DispatchQueue.main) // Ensure UI updates happen on the main thread
            .sink { completion in
                switch completion {
                case .failure(_): break
                case .finished: break
                }
            } receiveValue: { [weak self] movies in
                guard let self = self else { return }
                selectedMovieId = movies.first?.id
                mediaCardViewModels = movies.enumerated().map({MediaCardViewModel(resultCard: $1,
                                                                                  isSelected: $0 == 0, mediaRepository: self.mediaRepository)})
                 
            }
            .store(in: &cancellables)
    }

}
