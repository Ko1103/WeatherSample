//
//  WeatherOverviewViewController.swift
//  WeatherSample
//
//  Created by 山浦功 on 2018/07/25.
//  Copyright © 2018年 KoYamaura. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


struct ForecastModel {
    let time: String
    let description: String
    let temp: String
}


final class WeatherOverviewViewController: UIViewController {

    private var viewModel: WeatherViewModel!
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var forecastsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forecastsTableView.delegate = self
        self.viewModel = WeatherViewModel(weatherService: WeatherAPIService())
    }
    
    private var tableViewData: [(day: String, forecasts: [ForecastModel])]? {
        didSet { //値が変更された時にしたい処理を書く
            // oldValueで変更前の値を取得することができる。
            self.forecastsTableView.reloadData()
        }
    }
}

extension WeatherOverviewViewController: UITableViewDataSource , RxTableViewDataSourceType {
    
    func tableView(_ tableView: UITableView, observedEvent: Event<[(day: String, forecasts: [ForecastModel])]>) {
        switch observedEvent {
        case .next(let items):
            tableViewData = items
        case .error(let error):
            print(error)
        case .completed:
            tableViewData = nil
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableViewData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData?[section].forecasts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.tableViewData![section].day
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell") as! ForecastTableViewCell
        guard let forecast = tableViewData?[indexPath.section].forecasts[indexPath.row] else {
            return cell
        }
        cell.cityDegreesLabel.text = forecast.temp
        cell.dateLabel.text = forecast.time
        cell.weatherMessageLabel.text = forecast.description
        return cell
    }
}

extension WeatherOverviewViewController: UITableViewDelegate {}
