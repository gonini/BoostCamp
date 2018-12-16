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
    func requestMovies(orderType: OrderType)
}

public protocol Refreshable {
    func refresh()
}

public protocol MoviesBindable: Refreshable {
    var progressObservable: Observable<ProgressStatus> { get }
    var moviesObservable: Observable<[Movie]> { get }
}
