//
//  HomeWorker.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 04/07/22.
//

import Foundation

class HomeWorker {
    
    var iterator: HomeIterator!
    func networkRequest() {
        NetworkManager.networkRequest { [self] (model: WeatherForecast) in
            iterator.model = model
        }
    }
}
