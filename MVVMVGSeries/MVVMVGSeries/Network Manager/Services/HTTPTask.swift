//
//  HTTPTask.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 08/07/22.
//

import Foundation

enum HTTPTask {
    case request
    case requestWithParameters(urlParameter: Parameter?
                               ,encoding: ParameterEncoding
                               ,bodyParameter: Parameter?)
    case requestWithParametersHeaders(urlParameter: Parameter?
                                      ,encoding: ParameterEncoding
                                      ,bodyParameter: Parameter?
                                      ,header: Parameter?)
}
