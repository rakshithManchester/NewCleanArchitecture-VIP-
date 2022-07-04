//
//  LoginPresenter.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 01/07/22.
//

import Foundation
import RxSwift
import RxRelay

class LoginPresenter {
    weak var viewController : LoginViewController?
    var viewModel = LoginViewModel()
    var bag = DisposeBag()
    
    var username = BehaviorSubject<String>(value: "")
    var password = BehaviorSubject<String>(value: "")
    
    
    func enbleReactiveUI() {
        username
            .subscribe(onNext: { [self] value in
                viewModel.newUsername = value
                updateview()
            })
            .disposed(by: bag)
        password.subscribe(onNext: { [self] value in
            viewModel.newPassword = value
            updateview()
        })
        .disposed(by: bag)
    }
    
    func updateview() {
        if viewModel.newUsername.count > 3 && viewModel.newPassword.count > 3 {
            viewController?.loginButton.alpha = 1
            viewController?.loginButton.isEnabled = true
        } else {
            viewController?.loginButton.alpha = 0.5
            viewController?.loginButton.isEnabled = false
        }
    }
}
