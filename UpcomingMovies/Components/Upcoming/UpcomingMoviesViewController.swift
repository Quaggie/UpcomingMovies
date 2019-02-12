//
//  UpcomingMoviesViewController.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 10/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import UIKit

final class UpcomingMoviesViewController: UIViewController {
    // MARK: - Properties -
    unowned let coordinator: UpcomingMoviesCoordinatorDelegate
    private let screen = UpcomingMoviesViewControllerScreen()
    private lazy var dataSource = UpcomingMoviesDataSource(tableView: screen.tableView, movies: movies)
    private var movies: [Movie] = []
    
    // MARK: - Init -
    init(coordinator: UpcomingMoviesCoordinatorDelegate) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle -
    override func loadView() {
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupTableView()
    }
}

// MARK: - Setup -
extension UpcomingMoviesViewController {
    private func setupNavigationItem() {
        navigationItem.title = "Upcoming Movies"
    }
    
    private func setupTableView() {
        screen.tableView.dataSource = dataSource
        screen.tableView.delegate = self
    }
}

// MARK: - UITableViewDelegate -
extension UpcomingMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        coordinator.goToMovieDetail(movie: movie)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
