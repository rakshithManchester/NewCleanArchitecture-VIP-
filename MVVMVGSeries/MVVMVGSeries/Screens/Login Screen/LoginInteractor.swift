//
//  LoginInteractor.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 01/07/22.
//

import Foundation

class LoginInteractor {
    var worker: LoginWorker?
    var presenter: LoginPresenter!
    
    func passUsernamePassword(username: String?, password: String?) {
        presenter.passUsernamePassword(username: username, password: password)
    }
}

