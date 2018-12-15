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
        }
        
        defaultContainer.register(MoviesViewModel.self) { r in
            ViewModelFactory.createMoviesViewModel(
                service: r.resolve(BoxOfficeService.self)!)
        }
        
        defaultContainer.storyboardInitCompleted(MoviesTableViewController.self) { r, c in
            c.moviesViewModel = r.resolve(MoviesViewModel.self)!
        }
        
    }
    
}
