//
//  EndPoint.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 08/07/22.
//

import Foundation

enum WeatherEndPoint {
    case foreCast
    case currentWeather
}

extension WeatherEndPoint: EndPointType {
    var baseUrl: URL {
        switch NetworkManager.environment {
        case .prod:
            return URL(string: "https://api.openweathermap.org/data/2.5/")!
        case .stage:
            return URL(string: "")!
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .requestWithParameters(urlParameter: ["lat":"13.060212076454148", "lon":"77.58554121949155", "appid" :"1ef84661b0b599f01d31027b5da1cd93"]
                                      , encoding: .urlEncoding, bodyParameter: nil)
    }
    
    var path: String {
        return "forecast"
    }
    
    var headers: Parameter {
        return ["":""]
    }
    
    
}
