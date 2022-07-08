//
//  JsonEncoding.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 08/07/22.
//

import Foundation

struct JsonEncoding {
    func encode(requestUrl: inout URLRequest, parameters: Parameter?) {
        do {
            if let parameter = parameters {
                let data = try JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
                requestUrl.httpBody = data
                requestUrl.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch let error {
        
        }
    }
}
