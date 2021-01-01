//
//  LoginViewModel.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//

import UIKit
import RxSwift
struct LoginViewModel {
    
    let emailAddress = BehaviorSubject<String>(value: "")
    let password = BehaviorSubject(value: "")
    let isSignInActive: Observable<Bool>
    let disposeBag = DisposeBag()
    init() {
        self.isSignInActive = Observable.combineLatest(self.emailAddress, self.password).map { $0.0.count > 5 && $0.1.count > 5 }
    }
    let userResponse = PublishSubject<UserLogin.LoginResponse>()
    func loginUser(email: String, password: String) {
        AnimatedLoader.showLoader(type: .loader)
        let user = UserLogin.LoginRequest(email: email, password: password)
        AuthentificationServices.loginUser(with: user)
            .`do`(onSubscribe: {})
            .subscribe(onNext: { response in
                 AnimatedLoader.hideLoader()
                
                self.userResponse.onNext(response)
            }, onError: {error in
                 AnimatedLoader.hideLoader()

                debugPrint("error login", error)
            })
            .disposed(by: disposeBag)
    }
    
}
