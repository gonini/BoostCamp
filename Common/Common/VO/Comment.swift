//
//  Comment.swift
//  Common
//
//  Created by 장공의 on 14/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation

public struct Comment {
    
    let rating: Double
    let timestamp: Double
    let writer: String
    let movie_id: String
    let contents: String
    
    public init(rating: Double,
                timestamp: Double,
                writer: String,
                movie_id: String,
                contents: String) {
        self.rating = rating
        self.timestamp = timestamp
        self.writer = writer
        self.movie_id = movie_id
        self.contents = contents
    }
}
