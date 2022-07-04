//
//  DetailViewController.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 30/06/22.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController, StoryBoarded {
    
    var icon: String?
    var bag = DisposeBag()
    var interactor: DetailIterator!
    var router: DetailRouter!
    
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
