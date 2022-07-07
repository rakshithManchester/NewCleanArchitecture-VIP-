//
//  DetailIterator.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 04/07/22.
//

import Foundation

class DetailIterator {
    var presenter: DetailPresenter!
    var icon: String = ""
}

extension DetailIterator : DetailViewOutput {
    func sendWeatherImage() {
        icon.toImage(completion: { [self] icon in
            presenter.icon = icon
        })
    }
}
