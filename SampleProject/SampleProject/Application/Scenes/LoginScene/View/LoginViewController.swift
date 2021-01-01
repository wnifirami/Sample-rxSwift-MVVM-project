//
//  LoginViewController.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//

import UIKit
import Lottie
import RxSwift
import RxCocoa
import TextFieldEffects

class LoginViewController: UIViewController {
    @IBOutlet weak var viewAnimator: UIView!
    @IBOutlet weak var emailTextField: HoshiTextField!
    @IBOutlet weak var passwordTextField: HoshiTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    let disposeBag = DisposeBag()
    let anomationView = AnimationView()
    let viewModel: LoginViewModel
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAnimationView()
        setUpAnimationViewConstraints()
        setupBindings()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func touchIdTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func showHidepassword(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.isSecureTextEntry = !sender.isSelected
    }
    
    
}

extension LoginViewController {
    private func setupBindings(){
        self.emailTextField.rx.text.orEmpty
            .bind(to: viewModel.emailAddress)
            .disposed(by: disposeBag)
        
        self.passwordTextField.rx.text.orEmpty
            .bind(to: viewModel.password)
            .disposed(by: disposeBag)
        
        self.loginButton.rx.tap
            .bind { self.viewModel.loginUser(email: self.emailTextField.text ?? "", password: self.passwordTextField.text ?? "") }
            .disposed(by: disposeBag)
        
        viewModel.isSignInActive
            .bind(to: self.loginButton.rx.isEnabled)
            .disposed(by: self.disposeBag)
        
        viewModel.isSignInActive.subscribe(onNext: { (isEnabled) in
            self.loginButton.isEnabled = isEnabled
            self.loginButton.backgroundColor = isEnabled ? ColorConstant.enabledButton : ColorConstant.disabledButton
        }).disposed(by: disposeBag)
    }
    
    func setUpAnimationView() {
        anomationView.animation = Animation.named(LoaderCases.login.description)
        anomationView.frame = viewAnimator.bounds
        anomationView.backgroundColor = .clear
        anomationView.contentMode = .scaleAspectFill
        anomationView.play()
        anomationView.translatesAutoresizingMaskIntoConstraints = false
        anomationView.loopMode = .playOnce
        view.addSubview(anomationView)
    }
    
    func setUpAnimationViewConstraints() {
        anomationView.centerXAnchor.constraint(equalTo: viewAnimator.centerXAnchor).isActive = true
        anomationView.centerYAnchor.constraint(equalTo: viewAnimator.centerYAnchor).isActive = true
        anomationView.widthAnchor.constraint(equalTo: viewAnimator.widthAnchor).isActive = true
        anomationView.heightAnchor.constraint(equalTo: viewAnimator.heightAnchor).isActive = true
    }
    
}

