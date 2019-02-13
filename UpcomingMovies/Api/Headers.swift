//
//  Headers.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 13/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

final class Headers {
    private(set) var values: Params = [:]
    
    func update(_ value: String, forKey key: String) {
        values.updateValue(value, forKey: key)
    }
}

