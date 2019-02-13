//
//  UIImageView+Extension.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 11/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    typealias ImageResult = ((UIImage?) -> Void)
    
    func download(urlString: String) {
        let url = URL(string: urlString)
//        let processor = DownsamplingImageProcessor(size: frame.size) // >> RoundCornerImageProcessor(cornerRadius: 20)
        setupIndicatorType(.activity)
        kf.setImage(with: url,
                    placeholder: UIImage(named: "movie_placeholder"),
                    options: [
//                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(0.4)),
                        .cacheOriginalImage])
        {
            result in
            switch result {
            case .success(let value):
                self.image = value.image
            case .failure(let error):
                self.image = UIImage(named: "movie_error")
            }
        }
    }
    
    func setupIndicatorType(_ type: IndicatorType) {
        var kf = self.kf
        kf.indicatorType = type
    }
}
