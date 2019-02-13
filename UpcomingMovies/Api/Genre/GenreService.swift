//
//  GenreService.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 13/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

protocol GenreService {
    func getGenres(completion: @escaping Response<[Genre]>)
}
