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

class WeatherOverviewViewController: UIViewController {

    private var viewModel: WeatherViewModel!
    private let disposeBag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
