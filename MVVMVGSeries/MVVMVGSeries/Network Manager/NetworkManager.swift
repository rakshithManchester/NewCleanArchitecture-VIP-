//
//  NetworkManager.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 28/06/22.
//

import Foundation

class NetworkManager {
    static var environment : Environments = .prod
    static func networkData<T:Decodable>(router: Router<WeatherEndPoint>, completion: @escaping (Result<T,Error>) -> ()) {
        let requestURL = router.request(endpoint: .foreCast)
        URLSession.shared.dataTask(with: requestURL) { _data, _response, _error in
            guard let data = _data else {
                if let error = _error as NSError?, error.domain == NSURLErrorDomain {
                    completion(.failure(error))
                }
                return
            }
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let _error {
                completion(.failure(_error))
            }
        }.resume()
    }
}
