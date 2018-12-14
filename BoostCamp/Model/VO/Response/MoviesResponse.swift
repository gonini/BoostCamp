//
//  MoviesResponse.swift
//  BoostCamp
//
//  Created by 장공의 on 13/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation

struct MoviesResponse: Codable {
    
    var grade: Int
    var thumb: String
    var reservation_grade: Int
    var title: String
    var reservation_rate: Double
    var user_rating: Double
    var date: String
    var id: String
    
}
