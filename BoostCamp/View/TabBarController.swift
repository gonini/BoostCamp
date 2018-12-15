//
//  TabBarController.swift
//  BoostCamp
//
//  Created by 장공의 on 15/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import UIKit
import ViewModelInterface

class TabBarController: UITabBarController  {
    
    var viewModel: MoviesRequestable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preloadTabItems()
    }
    
    private func preloadTabItems() {
        for viewController in self.viewControllers! {
            _ = viewController.view
        }
    }
    
}
