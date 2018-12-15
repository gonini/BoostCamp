//
//  MoviesResponse.swift
//  Model
//
//  Created by 장공의 on 14/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation

struct MoviesResponse: Codable {
    var order_type: Int
    var movies: [MovieResponse]
}
