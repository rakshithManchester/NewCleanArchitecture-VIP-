//
//  DetailViewController.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 30/06/22.
//

import UIKit

protocol DetailViewInput {
    func updateWeatherImage(icon: UIImage?)
}

protocol DetailViewOutput {
    func sendWeatherImage()
}

class DetailViewController: UIViewController, StoryBoarded, DetailViewInput {
    
    var icon: String?
    var interactor: DetailIterator!
    var router: DetailRouter!
    
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.sendWeatherImage()
    }
    
    func updateWeatherImage(icon: UIImage?) {
        DispatchQueue.main.async { [self] in
            weatherIcon.image = icon
        }
    }
}
