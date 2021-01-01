//
//  AuthentificationServices.swift
//  SampleProject
//
//  Created by Rami Ounifi on 1/1/2021.
//

import Foundation
import Alamofire
import RxSwift

struct AuthentificationServices {

    static func loginUser(with user:  UserLogin.LoginRequest) -> Observable<  UserLogin.LoginResponse> {
        let request = Routes.LoginUser.authentificate(body: user)
        return Network.execute(request: request)
    }
    

}

