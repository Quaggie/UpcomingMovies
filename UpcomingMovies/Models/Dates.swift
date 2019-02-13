//
//  Dates.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 13/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import Foundation

struct Dates: Codable {
    var maximum: String?
    var minimum: String?
    
    var formattedMaximum: Date? {
        return DateHelper.formatFromApi(maximum)
    }
    
    var maximumYear: String? {
        return DateHelper.getYearFrom(date: formattedMaximum)
    }
    
    var formattedMinimum: Date? {
        return DateHelper.formatFromApi(minimum)
    }
    
    var minimumYear: String? {
        return DateHelper.getYearFrom(date: formattedMinimum)
    }
}
