//
//  MovieDetailsViewModel.swift
//  ViewModelInterface
//
//  Created by 장공의 on 17/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import Common
import RxSwift

public protocol MovieDetailsViewModel: Disposable {
    var progressObservable: Observable<ProgressStatus> { get }
    var movieDtailsObservable: Observable<MovieDetails> { get }
    func requestMovieDetails(movieId: String)
}
