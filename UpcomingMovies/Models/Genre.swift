//
//  Genre.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 13/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import Foundation

struct Genre: Codable {
    typealias Dictionary = [Int: String]
    
    let id: Int
    let name: String
    
    static func getNameBy(id: Int) -> String? {
        return genres[id]
    }
    
    static var genres: Dictionary = [:]
}

extension Genre {
    static func ==(lhs: Genre, rhs: Genre) -> Bool {
        return lhs.id == rhs.id
    }
}
