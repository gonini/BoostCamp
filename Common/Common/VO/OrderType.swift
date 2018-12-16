//
//  OrderType.swift
//  BoostCamp
//
//  Created by 장공의 on 13/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation

public enum OrderType: Int {
    case advanceRate = 0
    case curation = 1
    case releaseDate = 2
}

public extension OrderType {
    func toString() -> String {
        switch self {
        case .advanceRate:
            return "예매율"
        case .curation:
            return "큐레이션"
        case .releaseDate:
            return "개봉일"
        default:
            return ""
        }
    }
}
