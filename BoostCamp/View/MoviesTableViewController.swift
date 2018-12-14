//
//  FirstViewController.swift
//  BoostCamp
//
//  Created by 장공의 on 12/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import UIKit
import Model
import Common

class MoviesTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ModelFactory.createBoxOfficeSerice().getMovies(order: OrderType.curation)
        .subscribe()
    }


}

