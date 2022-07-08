//
//  ParameterEncoding.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 08/07/22.
//

import Foundation

enum ParameterEncoding {
    case urlEncoding
    case jsonEncoding
    case urlAndJsonEncoding
    
    func encode(requestUrl: inout URLRequest, urlParameter: Parameter, jsonParameter: Parameter) {
        switch self {
        case .urlEncoding:
            URLEncoding().encode(requestUrl: &requestUrl, _parameters: urlParameter)
        case .jsonEncoding:
            JsonEncoding().encode(requestUrl: &requestUrl, parameters: jsonParameter)
        case .urlAndJsonEncoding:
            URLEncoding().encode(requestUrl: &requestUrl, _parameters: urlParameter)
            JsonEncoding().encode(requestUrl: &requestUrl, parameters: jsonParameter)
        }
    }
}
