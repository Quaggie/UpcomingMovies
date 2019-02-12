//
//  UpcomingMoviesViewControllerScreen.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 11/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import UIKit

final class UpcomingMoviesViewControllerScreen: UIView {
    // MARK: - Properties -
    let tableView = UITableView()
    
    // MARK: - Init -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CodeView -
extension UpcomingMoviesViewControllerScreen: CodeView {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.fillSuperview()
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
