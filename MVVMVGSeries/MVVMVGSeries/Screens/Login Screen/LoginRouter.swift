//
//  LoginRouter.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 01/07/22.
//

import Foundation
import UIKit

protocol router {
    func pushScene(navigationController: UINavigationController)
}

class LoginRouter {
    func pushScene(navigationController: UINavigationController) {
        let loginConfigurator = LoginConfigurator()
        let loginVC = loginConfigurator.configure(parameters: ["":nil])
        navigationController.pushViewController(loginVC, animated: true)
    }
}
