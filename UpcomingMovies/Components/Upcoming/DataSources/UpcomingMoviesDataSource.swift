//
//  UpcomingMoviesDataSource.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 11/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import UIKit

protocol UpcomingMoviesDataSourceInfiniteScrollDelegate: AnyObject {
    func upcomingMoviesDataSourceInfiniteScrollDelegateOnExecute()
}

final class UpcomingMoviesDataSource: NSObject {
    // MARK: - Properties -
    private let movies: [Movie]
    private unowned let infiniteScrollDelegate: UpcomingMoviesDataSourceInfiniteScrollDelegate
    
    // MARK: - Init -
    init(tableView: UITableView,
         infiniteScrollDelegate: UpcomingMoviesDataSourceInfiniteScrollDelegate,
         movies: [Movie]) {
        self.infiniteScrollDelegate = infiniteScrollDelegate
        self.movies = movies
        super.init()
        register(tableView: tableView)
    }
    
    // MARK: - Setup -
    private func register(tableView: UITableView) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        tableView.register(MovieTableViewFooterView.self,
                           forHeaderFooterViewReuseIdentifier: MovieTableViewFooterView.identifier)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 100
    }
}

// MARK: - UITableViewDataSource -
extension UpcomingMoviesDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.title
        if let posterUrlString = movie.posterUrlString {
            cell.imageView?.download(urlString: posterUrlString)
        } else {
            cell.imageView?.image = UIImage(named: "movie_error")
        }
        
        let isAlmostOnBottom = indexPath.row == (movies.count - 2)
        if isAlmostOnBottom {
            infiniteScrollDelegate.upcomingMoviesDataSourceInfiniteScrollDelegateOnExecute()
        }
        return cell
    }
}
