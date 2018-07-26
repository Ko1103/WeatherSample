//
//  WeatherAPIService.swift
//  WeatherSample
//
//  Created by 山浦功 on 2018/07/24.
//  Copyright © 2018年 KoYamaura. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

class WeatherAPIService {
    
    private struct Constants {
        static let APPID = "6a700a1e919dc96b0a98901c9f4bec47" //後で入れる
        static let baseURL = "http://api.openweathermap.org/"
    }
    
    enum ResourcePath: String {
        case forecast = "data/2.5/forecast"
        case icon = "img/w/"
        var path: String {
            return Constants.baseURL + rawValue
        }
    }
    
    func search(withCity city: String) -> Observable<Weather> {
        let encodedCity = city.withPercentEncodedSpaces
        let params: [String: AnyObject] = [
            "q": encodedCity as AnyObject,
            "units": "metric" as AnyObject,
            "type": "like" as AnyObject,
            "APPID": Constants.APPID as AnyObject
        ]
        let url = try! ResourcePath.forecast.path.asURL()
        let urlRequest = URLRequest(url: url.appendingPathComponent(ResourcePath.forecast.rawValue))
        let request = try! URLEncoding.default.encode(urlRequest, with: params)
        var result: Observable<Weather>!
        Alamofire.request(request).responseJSON { (response) in
            if let data = response.data {
                let jsonDecoder = JSONDecoder()
                let weather = try! jsonDecoder.decode(Weather.self, from: data)
                result = Observable.just(weather)
            }
        }
        return result
    }
    
    func weatherImage(forID imageID: String) -> Observable<Data> {
        return request(.get, ResourcePath.icon.path + imageID + ".png").data()
    }
}

