//
//  MoviesRequestForm.swift
//  Model
//
//  Created by 장공의 on 14/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import Common

struct MoviesRequestForm {
    
    private let order_type: Int
    
    init(orderType: OrderType) {
        order_type = orderType.rawValue
    }
}
