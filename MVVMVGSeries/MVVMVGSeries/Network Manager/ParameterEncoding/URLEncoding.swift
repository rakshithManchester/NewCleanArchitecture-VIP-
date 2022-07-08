//
//  URLEncoding.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 08/07/22.
//

import Foundation

struct URLEncoding {
    func encode(requestUrl: inout URLRequest, _parameters: Parameter?) {
        guard let url = requestUrl.url else { return }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        if let parameters = _parameters {
            components?.queryItems =  parameters.map { Key, value in URLQueryItem(name: Key, value: "\(value)") }
        }
        requestUrl.setValue("application/json", forHTTPHeaderField: "Content-Type")
        requestUrl.url = components?.url
    }
}
