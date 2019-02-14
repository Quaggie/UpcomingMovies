//
//  UpcomingMoviesViewState.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 13/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import Foundation

enum UpcomingMoviesViewState: Equatable {
    case loading
    case loadingMore
    case finished
    case filtering
    case empty(String)
    case error(ApiError)
    case errorLoadingMore
}

func ==(lhs: UpcomingMoviesViewState, rhs: UpcomingMoviesViewState) -> Bool {
    switch (lhs, rhs) {
    case (.loading, .loading):
        return true
    case (.loadingMore, .loadingMore):
        return true
    case (.finished, .finished):
        return true
    case (.filtering, .filtering):
        return true
    case (.empty, .empty):
        return true
    case (.error, .error):
        return true
    case (.errorLoadingMore, .errorLoadingMore):
        return true
    default:
        return false
    }
}

