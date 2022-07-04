//
//  DetailPresenter.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 04/07/22.
//

import Foundation
import RxSwift
import RxCocoa

class DetailPresenter {
    
    var viewController: DetailViewController!
    var bag = DisposeBag()
    
    var icon :String = "" {
        didSet {
            icon.toImage().subscribe(onNext: { image in
                DispatchQueue.main.async { [self] in
                    viewController.weatherIcon.image = image
                }
            }).disposed(by: bag)
        }
    }
    
}
