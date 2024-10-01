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

 
class MediaCardViewModel: ObservableObject {
    let card: Movie
    @Published var showActions: Bool{
        didSet{
            executeFetchImage()
        }
    }
   
    @Published var image: UIImage?
    @Published var title = ""
    @Published var description: [Int]
    @Published var releaseDate = ""
    private let fetchImageUseCase: FetchImageUseCase

    private var cancellables = Set<AnyCancellable>()
    init (resultCard: Movie,isSelected:Bool ) {
        card = resultCard
        showActions = isSelected
        title = card.originalTitle
        description = card.genreids
        releaseDate = card.realeaseDate
        fetchImageUseCase = FetchImageUseCaseImpl(repo: MediaDetailsRepoImpl())
    }
    
    func executeFetchImage() {
        
            fetchImageUseCase.execute(imageString: card.posterPath)
                .receive(on: DispatchQueue.main)
                .sink { res in
                    
                } receiveValue: { [ weak self] receivedImage in
                    if let checkedImage = receivedImage {
                        self?.image = checkedImage
                    } else {
                        print("Could not convert data to image.")
                    }
                }.store(in: &cancellables)
        
        
    }
    func setImageToNil(){
        image = nil
    }
}
