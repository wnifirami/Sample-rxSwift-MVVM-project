//
//  Network.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//

import Foundation
import Alamofire
import RxSwift

struct Network {
    
    static func execute<T: Decodable>(request: URLRequestConvertible) -> Observable<T>  {
        return Observable.create { observer -> Disposable in
            let request = Alamofire.SessionManager.default.request(request)
                .validate()
                .responseData { alamofireResponse in
                    if let token = alamofireResponse.response?.allHeaderFields["Authorization"] as? String {
                        DefaultUtils.sharedInstance.userHeader = ["Content-Type":"application/json" ,"Authorization": token]
                    }
                    switch alamofireResponse.result {
                    case .success(let data):
                        let jsonDecoder = JSONDecoder()
                        do {
                            let response = try jsonDecoder.decode(T.self, from: data)
                            debugPrint(response, "decoded response")
                            observer.onNext(response)
                            observer.onCompleted()
                        } catch (_) {
                            observer.onError(APIError.parsingFailed)
                        }
                    case .failure(let error):
                        switch error {
                        case let err as NSError where err.code == NSURLErrorNotConnectedToInternet:
                            observer.onError(APIError.notConnectedToInternet)
                            
                        case let err as NSError where err.code == NSURLErrorTimedOut:
                            observer.onError(APIError.timedOut)
                        default:
                            observer.onError(error)
                        }
                    }
                }
            return Disposables.create(with: request.cancel)
        }
    }
}

