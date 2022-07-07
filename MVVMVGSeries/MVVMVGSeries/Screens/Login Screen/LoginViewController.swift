//
//  LoginViewController.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 29/06/22.
//

import UIKit

protocol LoginViewControllerOutput: AnyObject {
    func passUsernamePassword(username: String?, password: String?)
}

protocol LoginViewControllerInput: AnyObject {
    func updateLoginButtonUI(alpha: CGFloat, isEnabled: Bool)
}


class LoginViewController: UIViewController, StoryBoarded {
    
    var router: LoginRouter!
    var interactor: LoginInteractor!
    var viewModel = LoginViewModel()
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.delegate = self
        password.delegate = self
    }
    
    @IBAction func loginTap(sender: UIButton) {
        let homeRouter = HomeRouter()
        homeRouter.pushScene(navigationController: self.navigationController ?? UINavigationController())
    }
    
}

extension LoginViewController: UITextFieldDelegate, LoginViewControllerInput {
    func updateLoginButtonUI(alpha: CGFloat, isEnabled: Bool) {
        loginButton.alpha = alpha
        loginButton.isEnabled = isEnabled
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        interactor.passUsernamePassword(username: username.text, password: password.text)
    }
}
