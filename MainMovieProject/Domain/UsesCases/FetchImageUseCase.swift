//
//  FetchImageUseCase.swift
//  MainMovieProject
//
//  Created by hamdi on 30/9/2024.
//

import Foundation
import Combine
import NetworkingPackage
import UIKit

protocol FetchImageUseCase{
    func execute(imageString: String) -> AnyPublisher<UIImage?,NetworkError>
}

class FetchImageUseCaseImpl: FetchImageUseCase {
    private let repo:  MediaDetailsRepo
    
    init(repo: MediaDetailsRepo) {
        self.repo = repo
    }
    func execute(imageString: String) -> AnyPublisher<UIImage?, NetworkError> {
        repo.asyncGetMediaPortal(imageString: imageString)
    }
}
