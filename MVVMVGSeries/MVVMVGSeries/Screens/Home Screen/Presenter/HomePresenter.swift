//
//  HomePresenter.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 04/07/22.
//

import Foundation

class HomePresenter {
    var viewController: HomeViewController!
    
    func setupUI(_model: WeatherForecast) {
        viewController.viewModel.networkRequest(model: _model)
    }
}
