//
//  UpcomingMoviesViewController.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 10/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import UIKit

class UpcomingMoviesViewController: UIViewController {
    unowned let coordinator: UpcomingMoviesCoordinatorDelegate
    
    init(coordinator: UpcomingMoviesCoordinatorDelegate) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension UpcomingMoviesViewController: CodeView {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
        navigationItem.title = "Upcoming Movies"
    }
}
