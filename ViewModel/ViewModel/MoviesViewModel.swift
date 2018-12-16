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
    private var prevOrderType: OrderType = OrderType.advanceRate
    private let progressSubject: PublishSubject<ProgressStatus>
    private let moviesSubject: PublishSubject<[Movie]>
    
    public init(service: BoxOfficeService) {
        self.service = service
        progressSubject = PublishSubject()
        moviesSubject = PublishSubject()
    }
    
    public var progressObservable: Observable<ProgressStatus> {
        return progressSubject
    }
    
    public var moviesObservable: Observable<[Movie]> {
        return moviesSubject
    }
    
    public func requestMovies(orderType: OrderType) {
        self.prevOrderType = orderType
        progressSubject.onNext(ProgressStatus.show)
        service?.getMovies(order: orderType)
            .subscribeOn(MainScheduler.instance)
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(
                onSuccess: {
                    self.moviesSubject.onNext($0)
                    self.progressSubject.onNext(ProgressStatus.close)
                },
                onError: {
                    self.moviesSubject.onError($0)
                    self.progressSubject.onNext(ProgressStatus.close)
                }
            )
    }
    
    func refresh() {
        requestMovies(orderType: prevOrderType)
    }
    
    public func dispose() {
        service = nil
        progressSubject.dispose()
        moviesSubject.dispose()
    }
    
}
