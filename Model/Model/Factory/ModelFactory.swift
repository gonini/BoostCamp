//
//  ModelFactory.swift
//  Model
//
//  Created by 장공의 on 14/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import ViewModel

public class ModelFactory {
    
    public static func createBoxOfficeSerice() -> BoxOfficeService {
        return BoxOfficeServiceImp()
    }
    
}
