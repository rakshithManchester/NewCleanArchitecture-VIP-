//
//  DetailRouter.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 04/07/22.
//

import Foundation
import UIKit

class DetailRouter {
    
    func pushScene(navigationController: UINavigationController, icon: String?) {
        
        let detail = DetailConfigurator()
        let detailVC = detail.configure(parameters: ["icon":icon])
        navigationController.pushViewController(detailVC, animated: true)
    }
    
}
