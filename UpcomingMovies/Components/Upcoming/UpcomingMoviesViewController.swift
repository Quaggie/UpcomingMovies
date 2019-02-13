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
    private var movies: [Movie] = [Movie.mock, Movie.mock]
    
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
private extension UpcomingMoviesViewController {
    func setupNavigationItem() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = "Upcoming Movies"
    }
    
    func setupTableView() {
        screen.tableView.dataSource = dataSource
        screen.tableView.delegate = self
        screen.tableView.reloadData()
    }
}

// MARK: - Api -
private extension UpcomingMoviesViewController {
    func getMovies() {
        
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
