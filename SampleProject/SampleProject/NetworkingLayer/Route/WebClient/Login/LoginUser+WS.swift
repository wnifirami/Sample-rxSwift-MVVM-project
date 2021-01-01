//
//  LoginUser+WS.swift
//  SampleProject
//
//  Created by Rami Ounifi on 1/1/2021.
//

import Foundation
import Alamofire
extension Routes {
    enum LoginUser: URLRequestConvertible {
        
        case authentificate(body:  UserLogin.LoginRequest)
        
        private static let method = HTTPMethod.post
        
        private var path: String {
            switch self {
            case .authentificate:
                return EndPoints.login.description

            }
        }
        
        private func parameters() throws -> Data? {
            switch self {
            case .authentificate(let request):
                return try Routes.encode(request)

            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let url = try path.asURL()
            debugPrint(path, "path")
            var urlRequest = try URLRequest(url: url,
                                            method: LoginUser.method)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try parameters()
            return urlRequest
        }
    }
    
}

