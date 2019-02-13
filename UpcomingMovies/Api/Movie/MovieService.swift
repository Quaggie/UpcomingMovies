//
//  MovieService.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 13/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

protocol MovieService {
    func getUpcomingMovies(page: Int, completion: @escaping Response<UpcomingMoviesResponse>)
}
