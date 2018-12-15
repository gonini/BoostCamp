//
//  ViewModelFactory.swift
//  ViewModel
//
//  Created by 장공의 on 15/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import ViewModelInterface

public class ViewModelFactory {
    
    public static func createMoviesViewModel(service: BoxOfficeService) -> MoviesViewModel {
        return MoviesViewModelImp(service: service)
    }
}
