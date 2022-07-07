//
//  HomeViewController.swift
//  MVVMVGSeries
//
//  Created by Appaiah on 29/06/22.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController,StoryBoarded {
    
    var viewModel =  HomeViewModel()
    @IBOutlet weak var tableView: UITableView!
    var tableviewDelegate: TableViewDelegate!
    let bag = DisposeBag()
    var interactor: HomeIterator!
    var router: HomeRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.navigationItem.leftBarButtonItems = []
        self.navigationItem.hidesBackButton = true
        
        interactor.getWeatherForecastData()
    }
    
    
    
    func setupUI() {
        tableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: WeatherTableViewCell.cellID)
        
        tableviewDelegate = TableViewDelegate()
        tableView.delegate = tableviewDelegate
        
        viewModel.businessModel.asObservable().bind(to: tableView.rx.items(cellIdentifier: WeatherTableViewCell.cellID, cellType: WeatherTableViewCell.self)) { (index, data, cell) in
            cell.dateTime.text = data.dateTime
            cell.descript.text = data.description
            data.icon?.toImage(completion: { image in
                DispatchQueue.main.async { cell.imagevw.image = image }
            })
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(WeatherForecastBusinessModel.self).bind {(weather) in
            let detailRouter = DetailRouter()
            detailRouter.pushScene(navigationController: self.navigationController ?? UINavigationController(),icon: weather.icon ?? "")
            
        }
    }
}
