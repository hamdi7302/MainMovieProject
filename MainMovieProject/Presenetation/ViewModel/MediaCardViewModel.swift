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
    @Published var showActions: Bool
    @Published var image: UIImage?
    @Published var title = ""
    @Published var description: [Int]
    @Published var releaseDate = ""
    private let fetchImageUseCase: FetchImageUseCase
    private var favoriteUseCase: AddToFavoritesUseCase
    private var addRatingUseCase: AddRatingUseCase
    
    private var cancellables = Set<AnyCancellable>()
    init (resultCard: Movie,isSelected:Bool, mediaRepository : MediaDetailsRepo ) {
        card = resultCard
        showActions = isSelected
        title = card.originalTitle
        description = card.genreids
        releaseDate = card.realeaseDate
        fetchImageUseCase = FetchImageUseCaseImpl(repo: mediaRepository)
        favoriteUseCase = AddToFavoritesUseCaseImpl(favoritesRepository: mediaRepository)
        addRatingUseCase = AddRatingUseCaseImple(ratingRepository: mediaRepository)
    }
    
    func setRating (_ rating: Int){
        addRatingUseCase.execute(rateMovie: rating, mediaId: card.id).sink { res in
            
        } receiveValue: { res in
            print("rated Successfully") //  make a toast or something
        }.store(in: &cancellables)
    }
    
    func setFavorite(_ favorite: Bool){
        
        favoriteUseCase.execute(movie: FavoriteMovieDetailsDTO(media_id: card.id,
                                                               media_type: MediaTypeDTO(rawValue: card.mediaType ) ?? .movie,
                                                                favorite: favorite)).sink { res in
            
        } receiveValue: { res in
            print("Marked Successfullt") //  make a toast or something
        }.store(in: &cancellables)

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
