//
//  MovieTableViewFooterView.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 13/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import UIKit

enum MovieFooterViewState {
    case loading
    case error
}

protocol MovieTableViewFooterViewDelegate: AnyObject {
    func movieTableViewFooterViewDidTapRetryButton()
}

final class MovieTableViewFooterView: UITableViewHeaderFooterView {
    
    // MARK: - Static -
    static var height: CGFloat {
        return 70
    }
    
    // MARK: - Properties -
    weak var delegate: MovieTableViewFooterViewDelegate?
    var state: MovieFooterViewState = .loading {
        didSet {
            switch state {
            case .loading:
                activityIndicator.startAnimating()
                tryAgainBtn.isHidden = true
            case .error:
                activityIndicator.stopAnimating()
                tryAgainBtn.isHidden = false
            }
        }
    }
    
    // MARK: - Views -
    private let activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .white)
        ai.hidesWhenStopped = true
        ai.color = .black
        return ai
    }()
    
    private lazy var tryAgainBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Try again", for: .normal)
        btn.backgroundColor = .black
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(tryAgain), for: .touchUpInside)
        return btn
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Actions
private extension MovieTableViewFooterView {
    @objc func tryAgain() {
        delegate?.movieTableViewFooterViewDidTapRetryButton()
    }
}

// MARK: - CodeView -
extension MovieTableViewFooterView: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(activityIndicator)
        contentView.addSubview(tryAgainBtn)
    }
    
    func setupConstraints() {
        activityIndicator.fillSuperview()
        tryAgainBtn.fillSuperview()
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
