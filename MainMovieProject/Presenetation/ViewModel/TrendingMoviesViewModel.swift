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
    }
     func updateSelectedStates() {
            for index in mediaCardViewModels.indices {
                mediaCardViewModels[index].showActions = (mediaCardViewModels[index].card.id == selectedMovieId)
            }
        }
    
    func fetchtrendingMovies () {
        getTrendingUseCase.execute(params: .week)
            .receive(on: DispatchQueue.main) // Ensure UI updates happen on the main thread
            .sink { completion in
                switch completion {
                case .failure(_): break
                case .finished: break
                }
            } receiveValue: { [weak self] movies in
                guard let self = self else { return }
                
                mediaCardViewModels = movies.enumerated().map({MediaCardViewModel(index: $0, resultCard: $1,
                                                                                  isSelected: $0 == 0, mediaRepository: self.mediaRepository)})
                selectedMovieId = movies.first?.id
            }
            .store(in: &cancellables)
    }

}
