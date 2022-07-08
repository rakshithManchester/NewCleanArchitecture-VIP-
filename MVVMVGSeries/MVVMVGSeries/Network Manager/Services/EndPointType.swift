//
//  EndPointType.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 08/07/22.
//

import Foundation

protocol EndPointType {
    var baseUrl: URL {get}
    var httpMethod: HTTPMethod {get}
    var task: HTTPTask {get}
    var path: String {get}
    var headers: Parameter {get}
}

typealias Parameter = [String: Any]
