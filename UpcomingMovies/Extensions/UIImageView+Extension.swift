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
    
    func download(urlString: String, completion: @escaping ImageResult) {
        let url = URL(string: urlString)
        let processor = DownsamplingImageProcessor(size: frame.size) // >> RoundCornerImageProcessor(cornerRadius: 20)
//        kf.indicatorType = IndicatorType.activity
        kf.setImage(with: url,
                    placeholder: UIImage(named: "placeholderImage"),
                    options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(0.4)),
                        .cacheOriginalImage])
        {
            result in
            switch result {
            case .success(let value):
                completion(value.image)
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                completion(nil)
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
