//
//  CGpointExt.swift
//  MainMovieProject
//
//  Created by hamdi on 20/10/2024.
//

import Foundation

extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        return sqrt(pow(x - point.x, 2) + pow(y - point.y, 2))
    }
}
