//
//  UpcomingMoviesCoordinator.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 10/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import UIKit

protocol UpcomingMoviesCoordinatorDelegate: AnyObject {
    func goToMovieDetail(movie: Movie)
}

final class UpcomingMoviesCoordinator: Coordinator {
    // MARK - Properties -
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    // MARK: - Init -
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = UpcomingMoviesViewController(coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }
}

// MARK: - UpcomingMoviesCoordinatorDelegate -
extension UpcomingMoviesCoordinator: UpcomingMoviesCoordinatorDelegate {
    func goToMovieDetail(movie: Movie) {
        let viewController = MovieDetailViewController(movie: movie)
        navigationController.pushViewController(viewController, animated: true)
    }
}
