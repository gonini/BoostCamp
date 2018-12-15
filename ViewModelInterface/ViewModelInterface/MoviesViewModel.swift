//
//  MoviesViewModel.swift
//  ViewModelInterface
//
//  Created by 장공의 on 15/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import Common
import RxSwift

public protocol MoviesViewModel: MoviesRequestable, MoviesBindable, Disposable { }

public protocol MoviesRequestable {
    func requestMovies(orderType: OrderType);
}

public protocol MoviesBindable {
    var progressObservable: Observable<ProgressStatus> { get }
    var moviesObservable: Observable<[Movie]> { get }
}
