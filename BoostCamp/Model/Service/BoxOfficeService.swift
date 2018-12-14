//
//  BoxOfficeServiceProtocol.swift
//  BoostCamp
//
//  Created by 장공의 on 13/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import RxSwift
import Common

public protocol BoxOfficeService: class {
    
    func getMovies(order: OrderType) -> Single<[Movie]>
    
    func getMovieDetails(id: String) -> Single<MovieDetails>
    
    func getComments(movieId: String) -> Single<[Comment]>
    
}

