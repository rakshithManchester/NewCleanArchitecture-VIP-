//
//  HomeConfigurator.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 04/07/22.
//

import Foundation
import UIKit

class HomeConfigurator: configurator {
    func configure(parameters: [String: Any]) -> UIViewController {
        let viewController = HomeViewController.instantiate(storyBoard: "Home")
        let interactor = HomeIterator()
        let worker = HomeWorker()
        let presenter = HomePresenter()
        let router = HomeRouter()
        presenter.viewController = viewController
        interactor.worker = worker
        interactor.presenter = presenter
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
