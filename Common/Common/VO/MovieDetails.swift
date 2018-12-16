//
//  MovieDetails.swift
//  Common
//
//  Created by 장공의 on 14/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation

public struct MovieDetails {
    
    public let audience: String
    public let actor: String
    public let duration: String
    public let director: String
    public let synopsis: String
    public let genre: String
    public let rating: Rating
    public let image: String
    public let reservation_grade: String
    public let title: String
    public let reservation_rate: String
    public let user_rating: String
    public let date: String
    public let id: String
    public let comments: [Comment]
    
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
                id: String,
                comments: [Comment]) {
        self.audience = String(audience)
        self.actor = actor
        self.duration = String(duration)
        self.director = director
        self.synopsis = synopsis
        self.genre = genre
        self.rating = rating
        self.image = image
        self.reservation_grade = String(reservation_grade)
        self.title = title
        self.reservation_rate = String(reservation_rate)
        self.user_rating = String(user_rating)
        self.date = date
        self.id = id
        self.comments = comments
    }
}
