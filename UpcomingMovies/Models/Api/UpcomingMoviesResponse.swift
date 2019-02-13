//
//  UpcomingMoviesResponse.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 13/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

struct UpcomingMoviesResponse: Codable {
    var results: [Movie]?
    var page: Int?
    var totalResults: Int?
    var dates: Dates?
    var totalPages: Int?
}

