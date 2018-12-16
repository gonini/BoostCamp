//
//  SwinjectStoryboard.swift
//  BoostCamp
//
//  Created by 장공의 on 15/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import ViewModelInterface
import ViewModel
import Model
import Common
import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        
        defaultContainer.register(BoxOfficeService.self) { _ in
            ModelFactory.createBoxOfficeSerice()
        }.inObjectScope(.container)
        
        defaultContainer.register(MoviesViewModel.self) { r in
            ViewModelFactory.createMoviesViewModel(
                service: r.resolve(BoxOfficeService.self)!
            )
        }.inObjectScope(.container)
        
        defaultContainer.register(MovieDetailsViewModel.self) { r in
            ViewModelFactory.createMovieDetailsViewModel(
                service: r.resolve(BoxOfficeService.self)!
            )
    }
        
        defaultContainer.storyboardInitCompleted(TabBarController.self) { r, c in
            c.viewModel = r.resolve(MoviesViewModel.self)!
        }
        
        defaultContainer.storyboardInitCompleted(MovieTableViewController.self) { r, c in
            c.viewModel = r.resolve(MoviesViewModel.self)!
        }
        
        defaultContainer.storyboardInitCompleted(MoviesCollectionViewController.self) { r, c in
            c.viewModel = r.resolve(MoviesViewModel.self)!
        }
        
        defaultContainer.storyboardInitCompleted(MovieDetailsViewContoller.self) { r, c in
            c.viewModel = r.resolve(MovieDetailsViewModel.self)!
        }
        
    }
    
}
