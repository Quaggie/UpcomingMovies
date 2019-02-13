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
    private let movieApi: MovieService
    private let genreApi: GenreService
    private lazy var screen = UpcomingMoviesViewControllerScreen(errorViewDelegate: self)
    private lazy var dataSource = UpcomingMoviesDataSource(tableView: screen.tableView, movies: movies)
    private var state: UpcomingMoviesViewState<UpcomingMoviesResponse> = .loading {
        didSet {
            switch state {
            case .loading:
                break
            case .loadingMore:
                break
            case .finished(let response):
                if let totalPages = response.totalPages {
                    self.total = totalPages
                }
                if let page = response.page {
                    self.page = page
                }
                if let movies = response.results {
                    self.movies = movies
                }
            case .filtering:
                break
            case .empty:
                break
            case .error:
                break
            case .errorLoadingMore:
                break
            }
            screen.changeUI(for: state)
        }
    }
    
    private var total: Int = 0
    private var page: Int = 1
    private var movies: [Movie] = [] {
        didSet {
            dataSource = UpcomingMoviesDataSource(tableView: screen.tableView, movies: movies)
            screen.tableView.dataSource = dataSource
        }
    }
    private var filteredMovies: [Movie] = [] {
        didSet {
            dataSource = UpcomingMoviesDataSource(tableView: screen.tableView, movies: filteredMovies)
            screen.tableView.dataSource = dataSource
        }
    }
    private var isNotEmpty: Bool {
        return total > 0
    }
    
    // MARK: - Init -
    init(coordinator: UpcomingMoviesCoordinatorDelegate,
         movieApi: MovieService = MovieApi(),
         genreApi: GenreService = GenreApi()) {
        self.coordinator = coordinator
        self.movieApi = movieApi
        self.genreApi = genreApi
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
        setupSearchController()
        getMovies()
    }
}

// MARK: - Setup -
private extension UpcomingMoviesViewController {
    func setupNavigationItem() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = "Upcoming Movies"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.searchController = screen.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setupTableView() {
        screen.tableView.dataSource = dataSource
        screen.tableView.delegate = self
        screen.tableView.reloadData()
    }
    
    func setupSearchController() {
        definesPresentationContext = true
        screen.searchController.searchResultsUpdater = self
        screen.searchController.delegate = self
    }
}

// MARK: - Helpers -
private extension UpcomingMoviesViewController {
    func getMovieFor(indexPath: IndexPath) -> Movie {
        let movie: Movie
        if isFiltering() {
            movie = filteredMovies[indexPath.item]
        } else {
            movie = movies[indexPath.item]
        }
        return movie
    }
}

// MARK: - Api -
private extension UpcomingMoviesViewController {
    func getMovies() {
        if isNotEmpty, state == .loading {
            return
        }
        if isFiltering() {
            return
        }
        state = .loading
        genreApi.getGenres { [weak self] (genresResult) in
            guard let self = self else { return }
            
            switch genresResult {
            case .success:
                self.movieApi.getUpcomingMovies(page: 1) { [weak self] moviesResult in
                    guard let self = self else { return }
                    
                    switch moviesResult {
                    case .success(let response):
                        if let results = response.results {
                            self.movies = results
                            if results.isEmpty {
                                self.state = .empty("No movies found")
                            } else {
                                self.state = .finished(response)
                            }
                        } else {
                            self.state = .empty("No movies found")
                        }
                    case .error(let err):
                        if self.isNotEmpty {
                            self.state = .errorLoadingMore
                        } else {
                            self.state = .error(err)
                        }
                    }
                }
            case .error(let err):
                self.state = .error(err)
            }
        }
    }
}

// MARK: - UITableViewDelegate -
extension UpcomingMoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = getMovieFor(indexPath: indexPath)
        coordinator.goToMovieDetail(movie: movie)
    }
}

// MARK: - UISearchResultsUpdating -
extension UpcomingMoviesViewController: UISearchResultsUpdating {
    func searchBarIsEmpty() -> Bool {
        return screen.searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredMovies = movies.compactMap { movie in
            guard let title = movie.title,
                title.localizedLowercase.contains(searchText.localizedLowercase) else {
                    return nil
            }
            return movie
        }
        if filteredMovies.isEmpty {
            if searchBarIsEmpty() {
                filteredMovies = movies
                state = .filtering
            } else {
                state = .empty(searchText)
            }
        } else {
            state = .filtering
        }
    }
    
    func isFiltering() -> Bool {
        return screen.searchController.isActive && !searchBarIsEmpty()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.isActive {
            filterContentForSearchText(searchController.searchBar.text ?? "")
        }
    }
}

// MARK: UISearchControllerDelegate
extension UpcomingMoviesViewController: UISearchControllerDelegate {
    func willPresentSearchController(_ searchController: UISearchController) {
        filteredMovies = movies
        state = .filtering
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        let response = UpcomingMoviesResponse(results: movies, page: page, totalResults: total, dates: nil, totalPages: nil)
        state = .finished(response)
    }
}

extension UpcomingMoviesViewController: UpcomingMoviesErrorViewDelegate {
    func upcomingMoviesErrorViewDidTapButton() {
        getMovies()
    }
}
