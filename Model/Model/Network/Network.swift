//
//  Network.swift
//  Model
//
//  Created by 장공의 on 14/12/2018.
//  Copyright © 2018 zhanggoniui. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class Network {
    
    private static let BASE_HOST = "http://connect-boxoffice.run.goorm.io";
    
    func request<T: Decodable>(methodType: HTTPMethod, subUrl: String, requestParm: Any) -> Single<T> {
        
        guard methodType == HTTPMethod.get else {
            return Single<T>.never();
        }
        
        let url = URL(string: Network.BASE_HOST + subUrl)!
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        components.queryItems = getQuery(requestParm)
        
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        let request = URLRequest(url: components.url!)
        
        return Single<T>.create { single in
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let response = response, let data = data else {
                    single(.error(error ?? RxCocoaURLError.unknown))
                    return
                }
                
                guard response is HTTPURLResponse else {
                    single(.error(RxCocoaURLError.nonHTTPResponse(response: response)))
                    return
                }
                
                let a = try! JSONDecoder.init().decode(T.self, from: data);
                single(.success((a)))
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    
    
    private func getQuery(_ value: Any) -> [URLQueryItem]?
    {
        let mirror = Mirror(reflecting: value)
        
        var parameters = [String: String]()
        for (_, attr) in mirror.children.enumerated() {
            if let property_name = attr.label as String! {
                parameters[property_name] = stringFromAny(attr.value);
            }
        }
        
        return parameters.map { (key, value) in
            URLQueryItem(name: key, value: value);
        }
    }
    
    private func stringFromAny(_ value: Any?) -> String {
        if let nonNil = value, !(nonNil is NSNull) {
            return String(describing: nonNil)
        }
        return ""
    }
}
