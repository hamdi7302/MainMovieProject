//
//  CollpasedMovieCardViewModel.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import Foundation
import NetworkingPackage
import UIKit
import Combine
import NetworkingPackage

class CollpasedMovieCardViewModel: ObservableObject {
    let card : ResultCard
    let movieNetworkManager = MovieNetworkManager()
    
    @Published var image: UIImage?
    @Published var title = ""
    @Published var description = ""
    @Published var releaseDate = ""
    
    private var cancellables = Set<AnyCancellable>()
    init (resultCard: ResultCard) {
        card = resultCard
        title = card.originalTitle
        description = card.overview
        releaseDate = card.releaseDate
        movieNetworkManager.fetchImage(posterPath: card.posterPath)
            .receive(on: DispatchQueue.main)
            .sink { res in
                
            } receiveValue: { [weak self] receivedImage in
                if let checkedImage = receivedImage {
                    self?.image = checkedImage
                } else {
                    print("Could not convert data to image.")
                }
            }.store(in: &cancellables)
    }
}
