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
        let router = Router<WeatherEndPoint>()
        NetworkManager.networkData(router: router) { [self] (_ result: Result<WeatherForecast, Error>) in
            do {
                iterator.model = try result.get()
            } catch let exc {
                print(exc)
            }
        }
    }
}
