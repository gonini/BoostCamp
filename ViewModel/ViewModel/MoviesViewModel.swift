//
//  MoviesViewModel.swift
//  ViewModel
//
//  Created by 장공의 on 15/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import ViewModelInterface
import Common
import RxSwift


class MoviesViewModelImp: MoviesViewModel {
    
    private var service: BoxOfficeService?
    
    private let progress: PublishSubject<ProgressStatus>
    
    public init(service: BoxOfficeService) {
        self.service = service
        progress = PublishSubject()
    }
    
    public var progressObservable: Observable<ProgressStatus> {
        return progress
    }
    
    public func requestMovies(orderType: OrderType) -> Single<[Movie]> {
        progress.onNext(ProgressStatus.show)
        return service?.getMovies(order: orderType)
            .subscribeOn(MainScheduler.instance)
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .do(onSuccess: { _ in self.progress.onNext(ProgressStatus.close)})
            .do(onError: { _ in self.progress.onNext(ProgressStatus.close)})
            ?? Single.never()
    }
   
    public func dispose() {
        service = nil
        progress.dispose()
    }
    
}
