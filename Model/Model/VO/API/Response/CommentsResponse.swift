//
//  CommentsResponse.swift
//  BoostCamp
//
//  Created by 장공의 on 13/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation

struct CommentsResponse: Codable {
    
    var rating: Double
    var timestamp: Double
    var writer: String
    var movie_id: String
    var contents: String
    
}
