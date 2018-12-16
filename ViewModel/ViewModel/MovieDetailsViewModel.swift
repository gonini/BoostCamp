//
//  MovieDetailsViewModel.swift
//  ViewModel
//
//  Created by 장공의 on 17/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import Common
import RxSwift
import ViewModelInterface

class MovieDetailsViewModelImp: MovieDetailsViewModel {
    
    private var service: BoxOfficeService?
    private let progressSubject: PublishSubject<ProgressStatus>
    private let movieDetailsSubject: PublishSubject<MovieDetails>
    
    
    init(service: BoxOfficeService) {
        self.service = service
        progressSubject = PublishSubject()
        movieDetailsSubject = PublishSubject()
    }
    
    var progressObservable: Observable<ProgressStatus> {
        return progressSubject
    }
    
    var movieDtailsObservable: Observable<MovieDetails> {
        return movieDetailsSubject
    }
    
    func requestMovieDetails(movieId: String) {
        self.progressSubject.onNext(ProgressStatus.show)
        
        service?.getMovieDetails(id: movieId)
            .subscribeOn(MainScheduler.instance)
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(
                onSuccess: {
                    self.movieDetailsSubject.onNext($0)
                    self.progressSubject.onNext(ProgressStatus.close)
            },
                onError: {
                    self.progressSubject.onNext(ProgressStatus.close)
                    self.movieDetailsSubject.onError($0)
            }
        )
    }
    
    func dispose() {
        progressSubject.dispose()
        movieDetailsSubject.dispose()
        service = nil
    }
    
    
}

