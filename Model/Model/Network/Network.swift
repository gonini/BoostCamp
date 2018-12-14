//
//  Network.swift
//  Model
//
//  Created by 장공의 on 14/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import RxSwift

class Network {
    
    private static let BASE_URL = "http://connect-boxoffice.run.goorm.io/";
    
    func request<T>(methodType: HTTPMethod, subUrl: String, requestParm: AnyObject) -> Single<T> {
        
        guard methodType == HTTPMethod.get else {
            return Single<T>.never();
        }
        
        let mirror = Mirror(reflecting: requestParm)
        
        for (index, attr) in mirror.children.enumerated() {
            if let property_name = attr.label as String! {
                print("Attr \(index): \(property_name) = \(attr.value)")
            }
        }
        
        
        
        
        

        return Single<T>.never();
    }
}
