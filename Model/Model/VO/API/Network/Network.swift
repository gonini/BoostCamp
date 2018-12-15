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
    
    private static let BASE_URL = "http://connect-boxoffice.run.goorm.io";

    func request<T: Decodable>(methodType: HTTPMethod, resPath: ResourcesPath, reqParameter: Any) -> Single<T> {
        
        guard methodType == HTTPMethod.get else {
            return Single<T>.never()
        }
        
        let request = URLRequest(url: self.createURL(resPath, reqParameter))
        
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
                
                let result = try! JSONDecoder.init().decode(T.self, from: data);
                single(.success((result)))
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    private func createURL(_ resPath: ResourcesPath, _ reqParameter: Any) -> URL {
        var components = URLComponents(
            url: URL(string: Network.BASE_URL + resPath.rawValue)!,
            resolvingAgainstBaseURL: false
            )!
        
        components.queryItems = components.parsingQuery(sources: reqParameter)
        
        return components.url!;
    }
}

fileprivate extension URLComponents {
    
    func parsingQuery(sources: Any) -> [URLQueryItem]? {
        
        let mirror = Mirror(reflecting: sources)
        var parameters = [String: String]()
        
        for (_, attr) in mirror.children.enumerated() {
            if let key = attr.label as String? {
                parameters[key] = stringFromAny(attr.value);
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

