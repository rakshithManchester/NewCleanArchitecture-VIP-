//
//  LoginPresenter.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 01/07/22.
//

import Foundation

typealias LoginPresenterInput = LoginViewControllerOutput

class LoginPresenter {
    weak var viewController : LoginViewController?
    var viewModel = LoginViewModel()
    
}


extension LoginPresenter : LoginPresenterInput {
    func passUsernamePassword(username: String?, password: String?) {
        viewModel.newUsername = username ?? ""
        viewModel.newPassword = password ?? ""
        updateViewController()
    }
    
    func updateViewController() {
        if viewModel.newUsername.count > 3 && viewModel.newPassword.count > 3 {
            viewController?.updateLoginButtonUI(alpha: 1, isEnabled: true)
        } else {
            viewController?.updateLoginButtonUI(alpha: 0.5, isEnabled: false)
        }
    }
}
