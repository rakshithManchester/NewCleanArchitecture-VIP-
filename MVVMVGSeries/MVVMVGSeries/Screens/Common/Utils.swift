//
//  Utils.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 30/06/22.
//

import Foundation
import UIKit


extension String {
    
    func toImage(completion: @escaping (UIImage)->()) {
        let url = URL(string: self )!
        var image : UIImage = UIImage()
        URLSession.shared.dataTask(with: url) { _data, response, error in
            if let data = _data {
                image = UIImage(data: data) ?? UIImage()
                completion(image)
            }
        }.resume()
    }
}
