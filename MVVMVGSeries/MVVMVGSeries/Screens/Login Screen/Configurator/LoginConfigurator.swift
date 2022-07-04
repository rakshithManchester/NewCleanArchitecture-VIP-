//
//  LoginConfigurator.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 01/07/22.
//

import Foundation
import UIKit


protocol configurator {
    func configure(parameters: [String: Any]) -> UIViewController
}

class LoginConfigurator: configurator {
    func configure(parameters: [String: Any]) -> UIViewController {
        let viewController = LoginViewController.instantiate(storyBoard: "Login")
        let interactor = LoginInteractor()
        let worker = LoginWorker()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        presenter.viewController = viewController
        interactor.worker = worker
        interactor.presenter = presenter
        viewController.interactor = interactor
        
        viewController.router = router
        return viewController
    }
}
