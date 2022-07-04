//
//  LoginViewController.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 29/06/22.
//

import UIKit
import RxCocoa
import RxSwift


class LoginViewController: UIViewController, StoryBoarded {
    
    var router: LoginRouter!
    var interactor: LoginInteractor!
    var viewModel = LoginViewModel()
    var bag = DisposeBag()
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.enbleReactiveUI()
        username.rx.text
            .orEmpty
            .bind(to: interactor.name)
            .disposed(by: bag)
        
        password.rx.text
            .orEmpty
            .bind(to: interactor.password)
            .disposed(by: bag)
        
        viewModel.updateButton()
    }
    
    @IBAction func loginTap(sender: UIButton) {
        let homeRouter = HomeRouter()
        homeRouter.pushScene(navigationController: self.navigationController ?? UINavigationController())
    }
}
