//
//  UpcomingMoviesCoordinator.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 10/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import UIKit

protocol UpcomingMoviesCoordinatorDelegate: AnyObject {
    
}

final class UpcomingMoviesCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = UpcomingMoviesViewController(coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension UpcomingMoviesCoordinator: UpcomingMoviesCoordinatorDelegate {
    
}
