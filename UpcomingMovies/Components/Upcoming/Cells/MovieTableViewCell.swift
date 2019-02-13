//
//  MovieTableViewCell.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 12/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    private let imgView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let releaseYearLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private let overViewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()

    // MARK: - Init -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public functions -
    func setup(movie: Movie) {
        if let posterUrlString = movie.posterUrlString, !posterUrlString.isEmpty {
            imgView.download(urlString: posterUrlString)
        } else {
            imgView.image = UIImage(named: "movie_error")
        }
        
        if let title = movie.title, !title.isEmpty {
            titleLabel.text = title
        } else {
            titleLabel.text = "Title not found"
        }
        
        if let releaseYear = movie.releaseYear, !releaseYear.isEmpty {
            releaseYearLabel.text = releaseYear
        } else {
            releaseYearLabel.text = ""
        }
        
        if let voteAverage = movie.voteAverage {
            voteAverageLabel.text = "\(voteAverage)/10"
        } else {
            voteAverageLabel.text = ""
        }
        
        if let overView = movie.overview, !overView.isEmpty {
            overViewLabel.text = overView
        } else {
            overViewLabel.text = ""
        }
    }
}

// MARK: - Init -
extension MovieTableViewCell: CodeView {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
