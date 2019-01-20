//
//  Movie.swift
//  Common
//
//  Created by 장공의 on 14/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation

public class Movie {
    
    public let rating: Rating
    public let thumb: String
    public let reservation_grade: String
    public let title: String
    public let reservation_rate: String
    public let user_rating: String
    public let date: String
    public let id: String
    
    public init(rating: Rating,
                thumb: String,
                reservation_grade: Int,
                title: String,
                reservation_rate: Double,
                user_rating: Double,
                date: String,
                id: String) {
        self.rating = rating
        self.thumb = thumb
        self.reservation_grade =  String(reservation_grade)
        self.title = title
        self.reservation_rate = String(reservation_rate)
        self.user_rating = String(user_rating)
        self.date = date
        self.id = id
    }
}
