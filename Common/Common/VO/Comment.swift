//
//  Comment.swift
//  Common
//
//  Created by 장공의 on 14/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation

public struct Comment {

    public let rating: Double
    public let timestamp: String
    public let writer: String
    public let movie_id: String
    public let contents: String
    
    public init(rating: Double,
                timestamp: Double,
                writer: String,
                movie_id: String,
                contents: String) {
        self.rating = rating
        self.timestamp = timestamp.toTimeStamp()
        self.writer = writer
        self.movie_id = movie_id
        self.contents = contents
    }
}

private extension Double {
    
    func toTimeStamp() -> String {
        let date = NSDate(timeIntervalSince1970: self)
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "YYYY-MM-dd, hh:mm:ss"
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        return dateString
    }
    
}
