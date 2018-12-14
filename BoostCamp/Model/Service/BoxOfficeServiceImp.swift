//
//  BoxOfficeServiceImp.swift
//  BoostCamp
//
//  Created by 장공의 on 13/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import RxSwift
import Common

 class BoxOfficeServiceImp: BoxOfficeService {
    
    let network: Network = Network()
        
    func getMovies(order: OrderType) -> Single<[Movie]> {
        
        let ret: Single<MoviesResponse> = network.request(
            methodType: HTTPMethod.get,
            subUrl: "/movies",
            requestParm: MoviesRequestForm(orderType: order));
        
        ret.subscribe();
        
        return Single<[Movie]>.never()
    }
    
    func getMovieDetails(id: String) -> Single<MovieDetails> {
        return Single<MovieDetails>.never()
    }
    
    func getComments(movieId: String) -> Single<[Comment]> {
        return Single<[Comment]>.never()
    }
}


