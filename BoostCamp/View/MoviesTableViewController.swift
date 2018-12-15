//
//  FirstViewController.swift
//  BoostCamp
//
//  Created by 장공의 on 12/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import UIKit
import RxSwift
import Common
import ViewModelInterface

class MoviesTableViewController: UIViewController {
    
    var moviesViewModel: MoviesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        moviesViewModel?.requestMovies(orderType: OrderType.advanceRate)
        
    }
    
}

