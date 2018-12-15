//
//  MovieDetails.swift
//  Common
//
//  Created by 장공의 on 14/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation

public struct MovieDetails {
    
    let audience: Int
    let actor: String
    let duration: Int
    let director: String
    let synopsis: String
    let genre: String
    let rating: Rating
    let image: String
    let reservation_grade: Int
    let title: String
    let reservation_rate: Double
    let user_rating: Double
    let date: String
    let id: String
    
    public init(audience: Int,
                actor: String,
                duration: Int,
                director: String,
                synopsis: String,
                genre: String,
                rating: Rating,
                image: String,
                reservation_grade: Int,
                title: String,
                reservation_rate: Double,
                user_rating: Double,
                date: String,
                id: String) {
        self.audience = audience
        self.actor = actor
        self.duration = duration
        self.director = director
        self.synopsis = synopsis
        self.genre = genre
        self.rating = rating
        self.image = image
        self.reservation_grade = reservation_grade
        self.title = title
        self.reservation_rate = reservation_rate
        self.user_rating = user_rating
        self.date = date
        self.id = id
    }
}
