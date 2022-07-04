//
//  LoginInteractor.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 01/07/22.
//

import Foundation
import RxSwift
import RxCocoa



class LoginInteractor {
    var bag = DisposeBag()
    var worker: LoginWorker?
    var presenter: LoginPresenter!
    
    var name: BehaviorSubject<String> = BehaviorSubject<String>(value: "")
    var password: BehaviorSubject<String> = BehaviorSubject<String>(value: "")
    
    func enbleReactiveUI() {
        presenter?.enbleReactiveUI()
        name.subscribe(onNext: { [self] value in
            presenter.username.onNext(value)
        })
        .disposed(by: bag)
        password.subscribe(onNext: { [self] value in
            presenter.password.onNext(value)
        })
        .disposed(by: bag)
    }
}
