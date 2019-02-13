//
//  Result.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 13/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

enum Result<T> {
    case success(T)
    case error(ApiError)
}
