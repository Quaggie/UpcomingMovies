//
//  MovieDetailViewController.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 11/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    // MARK: - Properties -
    private let movie: Movie
    
    // MARK: - Init -
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        view.backgroundColor = .white
    }
}

// MARK: - Setup -
private extension MovieDetailViewController {
    func setupNavigationItem() {
        navigationItem.title = movie.title
    }
}
