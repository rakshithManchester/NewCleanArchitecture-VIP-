//
//  DetailConfigurator.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 04/07/22.
//

import Foundation
import UIKit

class DetailConfigurator: configurator {
    func configure(parameters: [String: Any]) -> UIViewController {
        let viewController = DetailViewController.instantiate(storyBoard: "Detail")
        let interactor = DetailIterator()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        presenter.viewController = viewController
        interactor.presenter = presenter
        viewController.interactor = interactor
        viewController.router = router
        interactor.icon = parameters["icon"] as! String
        
        return viewController
    }
    
    
}
