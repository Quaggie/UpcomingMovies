//
//  MovieImageURL.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 13/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

struct MovieImageURL {
    let path: String
    
    var poster: String {
        return "https://image.tmdb.org/t/p/w300\(path)"
    }
    
    var backdrop: String {
        return "https://image.tmdb.org/t/p/w780\(path)"
    }
}

