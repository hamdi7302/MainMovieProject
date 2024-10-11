//
//  FactoryClass.swift
//  MainMovieProject
//
//  Created by hamdi on 10/10/2024.
//

import Foundation

class DIContainer {
    // This class is responsible for managing dependency injection and object creation
    func makeTrendingViewModel() -> TrendingMoviesViewModel {
        let repository = TrendingMediaRepositoryImpl()
        let useCase = GetTrendingUseCaseImpl(repository: repository)
        let mediaRepository = MediaDetailsRepoImpl()
        return TrendingMoviesViewModel(getTrendingUseCase: useCase, mediaRepository: mediaRepository)
    }
}
