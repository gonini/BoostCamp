//
//  Movie.swift
//  Common
//
//  Created by 장공의 on 14/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation

public struct Movie {
    
    var rating: Rating
    var thumb: String
    var reservation_grade: Int
    var title: String
    var reservation_rate: Double
    var user_rating: Double
    var date: String
    var id: String
    
    public init(rating: Rating,
                thumb: String,
                reservation_grade: Int,
                title: String,
                reservation_rate: Double,
                user_rating: Double,
                date: String,
                id: String) {
        self.rating = rating;
        self.thumb = thumb;
        self.reservation_grade = reservation_grade;
        self.title = title;
        self.reservation_rate = reservation_rate;
        self.user_rating = user_rating;
        self.date = date;
        self.id = id;
    }
}
