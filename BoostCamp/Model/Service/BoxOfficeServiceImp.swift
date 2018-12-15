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
        
        let moviesResponseSingle: Single<MoviesResponse> = network.request(
            methodType: HTTPMethod.get,
            resPath: ResourcesPath.Movies,
            reqParameter:  MoviesRequestForm(orderType: order));
        
        return moviesResponseSingle
            .map { $0.movies }
            .map { $0.map{ movieRes -> Movie in
                return Movie(
                    rating: Rating.init(rawValue: movieRes.grade) ?? Rating.all,
                    thumb: movieRes.thumb,
                    reservation_grade: movieRes.reservation_grade,
                    title: movieRes.title,
                    reservation_rate: movieRes.reservation_rate,
                    user_rating: movieRes.user_rating,
                    date: movieRes.date,
                    id: movieRes.id);
                }};
    }
    
    func getMovieDetails(id: String) -> Single<MovieDetails> {
        return Single<MovieDetails>.never()
    }
    
    func getComments(movieId: String) -> Single<[Comment]> {
        return Single<[Comment]>.never()
    }
}


