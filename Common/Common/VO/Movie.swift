//
//  Movie.swift
//  Common
//
//  Created by 장공의 on 14/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation

public struct Movie {
    
    let rating: Rating
    let thumb: String
    let reservation_grade: Int
    let title: String
    let reservation_rate: Double
    let user_rating: Double
    let date: String
    let id: String
    
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
