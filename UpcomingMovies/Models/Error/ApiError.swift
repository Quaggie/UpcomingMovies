//
//  ApiError.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 13/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

struct ApiError: Codable {
    var statusCode: Int?
    var statusMessage: String?
    var success: Bool = false
    
    init(statusMessage: String) {
        self.statusCode = 500
        self.statusMessage = statusMessage
    }
    
    static var defaultModel: ApiError {
        return ApiError(statusMessage: "Unable to connect to the server")
    }
}
