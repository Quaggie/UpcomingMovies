//
//  AppCoordinator.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 10/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let upcomingMoviesCoordinator = UpcomingMoviesCoordinator(navigationController: navigationController)
        childCoordinators.append(upcomingMoviesCoordinator)
        upcomingMoviesCoordinator.start()
    }
}
