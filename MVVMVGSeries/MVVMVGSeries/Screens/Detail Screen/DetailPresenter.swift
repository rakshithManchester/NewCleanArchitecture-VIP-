//
//  DetailPresenter.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 04/07/22.
//

import Foundation
import UIKit

class DetailPresenter {
    
    var viewController: DetailViewController?
    var viewModel: DetailViewModel?
    
    var icon : UIImage = UIImage() {
        didSet {
            viewModel?.icon = icon
            viewController?.updateWeatherImage(icon: viewModel?.icon)
        }
    }
    
}
