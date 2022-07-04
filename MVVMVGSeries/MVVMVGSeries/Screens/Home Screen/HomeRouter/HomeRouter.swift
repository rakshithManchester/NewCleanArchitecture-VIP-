//
//  HomeRouter.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 04/07/22.
//

import Foundation
import UIKit

class HomeRouter: router {
    func pushScene(navigationController: UINavigationController) {
        let configurator = HomeConfigurator()
        let vc = configurator.configure(parameters: ["":nil])
        navigationController.pushViewController(vc, animated: true)
    }
}
