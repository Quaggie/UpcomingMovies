//
//  Movie.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 11/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import Foundation

class Movie: Codable {
    var posterPath: String?
    var adult: Bool?
    var overview: String?
    var releaseDate: String?
    var genreIds: [Int]?
    var id: Int?
    var originalTitle: String?
    var originalLanguage: String?
    var title: String?
    var backdropPath: String?
    var popularity: String?
    var voteCount: Int?
    var video: Bool?
    var voteAverage: Float?
    
    var formattedReleaseDate: Date? {
        if let releaseDate = releaseDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-DD"
            return dateFormatter.date(from: releaseDate)
        }
        return nil
    }
    
    var releaseYear: String? {
        if let date = formattedReleaseDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY"
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    var posterUrlString: String? {
        if let posterPath = posterPath {
            return "https://image.tmdb.org/t/p/w300\(posterPath)"
        }
        return nil
    }
    
    var backdropUrlString: String? {
        if let backdropPath = backdropPath {
            return "https://image.tmdb.org/t/p/w780\(backdropPath)"
        }
        return nil
    }
}

extension Movie {
    static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
}
