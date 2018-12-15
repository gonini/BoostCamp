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
import ViewModel

 class BoxOfficeServiceImp: BoxOfficeService {
    
    private let network: Network = Network()
        
    func getMovies(order: OrderType) -> Single<[Movie]> {
        
        let moviesResponse: Single<MoviesResponse> = network.request(
            methodType: HTTPMethod.get,
            resPath: ResourcesPath.movies,
            reqParameter:  MoviesRequestForm(orderType: order))
        
        return moviesResponse
            .map { $0.movies }
            .map { $0.map { movieRes -> Movie in
                return Movie(
                    rating: Rating.init(rawValue: movieRes.grade) ?? Rating.all,
                    thumb: movieRes.thumb,
                    reservation_grade: movieRes.reservation_grade,
                    title: movieRes.title,
                    reservation_rate: movieRes.reservation_rate,
                    user_rating: movieRes.user_rating,
                    date: movieRes.date,
                    id: movieRes.id)
                }
        };
    }
    
    func getMovieDetails(id movieId: String) -> Single<MovieDetails> {
        
        let movieDetailsResponse: Single<MovieDetailsResponse> = network.request(
            methodType: HTTPMethod.get,
            resPath: ResourcesPath.movieDetails,
            reqParameter: MovieDetailsRequestForm(movieId: movieId))
        
        return movieDetailsResponse
            .map { res -> MovieDetails in
                return MovieDetails(
                    audience: res.audience,
                    actor: res.actor,
                    duration: res.duration,
                    director: res.director,
                    synopsis: res.synopsis,
                    genre: res.genre,
                    rating: Rating.init(rawValue: res.grade) ?? Rating.all,
                    image: res.image,
                    reservation_grade: res.reservation_grade,
                    title: res.title,
                    reservation_rate: res.reservation_rate,
                    user_rating: res.user_rating,
                    date: res.date,
                    id: res.id)
        }
    }
    
    func getComments(movieId: String) -> Single<[Comment]> {
        
        let commentsResponse: Single<CommentsResponse> = network.request(
            methodType: HTTPMethod.get,
            resPath: ResourcesPath.comments,
            reqParameter: CommentRequestForm(movieId: movieId));
        
        return commentsResponse
            .map { $0.comments }
            .map { $0.map { res -> Comment in
                return Comment(
                    rating: res.rating,
                    timestamp: res.timestamp,
                    writer: res.writer,
                    movie_id: res.movie_id,
                    contents: res.contents)
                }
        }
    }
}


