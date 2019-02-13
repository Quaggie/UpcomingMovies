//
//  Endpoints.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 13/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

private protocol Endpoint {
    var endpoint: String { get }
    var value: String { get }
}

enum Endpoints {
    private static var version: Int = 3
    private static var baseUrl: String { return "\(MovieApiConfig.baseUrl)/\(Endpoints.version)" }
    
    enum movie: Endpoint {
        var endpoint: String { return "movie" }
        case upcoming
        
        var value: String {
            switch self {
            case .upcoming: return "\(Endpoints.baseUrl)/\(endpoint)/upcoming"
            }
        }
    }
    
    enum genre: Endpoint {
        var endpoint: String { return "genre" }
        case all
        
        var value: String {
            switch self {
            case .all: return "\(Endpoints.baseUrl)/\(endpoint)/movie/list"
            }
        }
    }
}
