//
//  HomeIterator.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 04/07/22.
//

import Foundation

class HomeIterator {
    var worker: HomeWorker!
    var presenter: HomePresenter!
    var model: WeatherForecast! {
        didSet {
            presenter.setupUI(_model: model)
        }
    }
    
    func getWeatherForecastData() {
        worker.iterator = self
        worker.networkRequest()
    }
}
