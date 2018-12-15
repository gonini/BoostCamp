//
//  File.swift
//  Model
//
//  Created by 장공의 on 14/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation

struct MovieDetailsResponse: Codable {
    var audience: Int
    var actor: String
    var duration: Int
    var director: String
    var synopsis: String
    var genre: String
    var grade: Int
    var image: String
    var reservation_grade: Int
    var title: String
    var reservation_rate: Double
    var user_rating: Double
    var date: String
    var id: String
}
