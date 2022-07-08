//
//  Router.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 08/07/22.
//

import Foundation

class Router<_endPoint: EndPointType> {
    func request(endpoint: _endPoint) -> URLRequest {
        var requestUrl = URLRequest(url: endpoint.baseUrl.appendingPathComponent(endpoint.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        requestUrl.httpMethod = endpoint.httpMethod.rawValue
        switch endpoint.task {
        case .request:
            requestUrl.setValue("application/json", forHTTPHeaderField: "Content-Type")
        case .requestWithParameters(urlParameter: let urlParameter
                                    ,encoding: let encoding
                                    ,bodyParameter: let bodyParameter):
            buildRequest(requestURL: &requestUrl, urlParameter: urlParameter, encoding: encoding, bodyParameter: bodyParameter)
        case .requestWithParametersHeaders(urlParameter: let urlParameter
                                           ,encoding: let encoding
                                           ,bodyParameter: let bodyParameter
                                           ,header: let header):
            buildRequest(requestURL: &requestUrl, urlParameter: urlParameter, encoding: encoding, bodyParameter: bodyParameter,headerParameter: header)
        }
        return requestUrl
    }
    
    private func buildRequest(requestURL: inout URLRequest
                              ,urlParameter: Parameter?
                              ,encoding: ParameterEncoding
                              ,bodyParameter: Parameter?
                              ,headerParameter: Parameter? = Parameter()) {
        switch encoding {
        case .urlEncoding:
            URLEncoding().encode(requestUrl: &requestURL, _parameters: urlParameter)
        case .jsonEncoding:
            JsonEncoding().encode(requestUrl: &requestURL, parameters: bodyParameter)
        case .urlAndJsonEncoding:
            URLEncoding().encode(requestUrl: &requestURL, _parameters: urlParameter)
            JsonEncoding().encode(requestUrl: &requestURL, parameters: bodyParameter)
        }
    }
}
