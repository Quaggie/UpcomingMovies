//
//  AppDelegate.swift
//  UpcomingMovies
//
//  Created by Jonathan Bijos on 10/02/19.
//  Copyright © 2019 jonathanbijos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
}

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAppCoordinator()
        setupWindow(rootViewController: appCoordinator?.navigationController)
        
        // TODO: REMOVE
        let genreApi = GenreApi()
        genreApi.getGenres { (genresResult) in
            switch genresResult {
            case .success:
                let movieApi = MovieApi()
                movieApi.getUpcomingMovies(page: 1) { moviesResult in
                    switch moviesResult {
                    case .success(let movies):
                        print(movies)
                    case .error(let err):
                        print(err)
                    }
                }
            case .error(let err):
                print(err)
            }
        }
        
        return true
    }
}

private extension AppDelegate {
    func setupWindow(rootViewController: UIViewController?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = appCoordinator?.navigationController
        window?.makeKeyAndVisible()
        window?.tintColor = UIColor.black
    }
    
    func setupAppCoordinator() {
        appCoordinator = AppCoordinator(navigationController: UINavigationController())
        appCoordinator?.start()
    }
}
