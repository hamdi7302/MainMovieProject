//
//  MediaCardViewModel.swift
//  MainMovieProject
//
//  Created by hamdi on 26/9/2024.
//

import Foundation
import NetworkingPackage
import UIKit
import Combine

enum MediaCardState {
    case favorite(Bool)
    case watchList(Bool)
    case rating(Int)
}

class MediaCardViewModel: ObservableObject {
    let card: Movie
    @Published var showActions: Bool
    @Published var showRatingview: Bool
    @Published var rating: Int = 0 {
        didSet {
            updateState(.rating(rating))
        }
    }
    @Published var showInfoDetails = false
    @Published var favorie = false {
        didSet {
            updateState(.favorite(favorie))
        }
    }
    @Published var watchList = false {
        didSet {
            updateState(.watchList(watchList))
        }
    }
    @Published var image: UIImage?
    @Published var title: String
    @Published var description: [Int]
    @Published var releaseDate: String
    @Published var showVideo: Bool = false {
        didSet{
            if showVideo == true {
                trailerVideo()
            }
        }
    }
    @Published var videoUrl: String? = nil
    
    
    private let fetchImageUseCase: FetchImageUseCase
    private let favoriteUseCase: AddToFavoritesUseCase
    private let addRatingUseCase: AddRatingUseCase
    private let addWatchListUseCase: AddWishListUseCase
    private let fetchTrailersUseCase: FetchTrailersUseCaseImpl
    private var cancellables = Set<AnyCancellable>()

    init(resultCard: Movie, isSelected: Bool, mediaRepository: MediaDetailsRepo) {
        self.card = resultCard
        self.showActions = isSelected
        self.showRatingview = false
        self.title = card.originalTitle
        self.description = card.genreids
        self.releaseDate = card.realeaseDate
        
        self.fetchImageUseCase = FetchImageUseCaseImpl(repo: mediaRepository)
        self.favoriteUseCase = AddToFavoritesUseCaseImpl(favoritesRepository: mediaRepository)
        self.addRatingUseCase = AddRatingUseCaseImpl(ratingRepository: mediaRepository)
        self.addWatchListUseCase = AddWishListUseCaseImpl(ratingRepository: mediaRepository)
        self.fetchTrailersUseCase = FetchTrailersUseCaseImpl(fetchTrailersRepo: mediaRepository)
        
    }

    private func updateState(_ state: MediaCardState) {
        switch state {
        case .favorite(let isFavorite):
            setFavorite(isFavorite)
        case .watchList(let isWished):
            setWatchList(isWished)
        case .rating(let newRating):
            setRating(newRating)
        }
    }

    private func setRating(_ rating: Int) {
        addRatingUseCase.execute(rateMovie: rating, mediaId: card.id)
            .sink { completion in
                // Handle completion (success/error)
            } receiveValue: { _ in
                print("Rated Successfully")
            }
            .store(in: &cancellables)
    }
    
    private func trailerVideo() {
        fetchTrailersUseCase.execute(fechTrailerFor: card.id)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    // Handle successful completion, if needed
                    print("Trailer fetch completed successfully.")
                case .failure(let error):
                    // Print error message on failure
                    print("Failed to fetch trailer: \(error.localizedDescription)")
                }
            } receiveValue: { [self] res in
                if let key = res.results.first?.key {
                    videoUrl = key
                } else {
                    print("No trailer found.")
                }
            }
            .store(in: &cancellables)
    }
    

    private func setWatchList(_ watchList: Bool) {
        let watchListDTO = WatchlistMovieDetailsDTO(media_id: card.id,
                                                    media_type: MediaTypeDTO(rawValue: card.mediaType) ?? .movie,
                                                    watchlist: watchList)
        
        addWatchListUseCase.execute(watchList: watchListDTO)
            .sink { completion in
                // Handle completion (success/error)
            } receiveValue: { _ in
                print("WatchList added Successfully")
            }
            .store(in: &cancellables)
    }

    private func setFavorite(_ favorite: Bool) {
        let favoriteDTO = FavoriteMovieDetailsDTO(media_id: card.id,
                                                  media_type: MediaTypeDTO(rawValue: card.mediaType) ?? .movie,
                                                  favorite: favorite)
        
        favoriteUseCase.execute(movie: favoriteDTO)
            .sink { completion in
                // Handle completion (success/error)
            } receiveValue: { _ in
                print("Marked Successfully") // Consider showing a toast or notification
            }
            .store(in: &cancellables)
    }

    func executeFetchImage() {
        fetchImageUseCase.execute(imageString: card.posterPath)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                // Handle completion (success/error)
            } receiveValue: { [weak self] receivedImage in
                if let checkedImage = receivedImage {
                    self?.image = checkedImage
                } else {
                    print("Could not convert data to image.")
                }
            }
            .store(in: &cancellables)
    }

    func setImageToNil() {
        image = nil
    }
}
