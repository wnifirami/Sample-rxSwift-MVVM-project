//
//  LoginViewController.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//

import UIKit

class LoginViewController: UIViewController {

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

        // Do any additional setup after loading the view.
    }




}
