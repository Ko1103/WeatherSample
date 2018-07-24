//
//  String+percentEncoding.swift
//  WeatherSample
//
//  Created by 山浦功 on 2018/07/24.
//  Copyright © 2018年 KoYamaura. All rights reserved.
//

import Foundation

extension String {
    var withPercentEncodedSpaces: String {
        let unreserved = "-._~/?"
        var allowed = CharacterSet.alphanumerics
        allowed.insert(charactersIn: unreserved)
        return addingPercentEncoding(withAllowedCharacters: allowed)!
    }
}
