//
//  Array+uniqueElements.swift
//  WeatherSample
//
//  Created by 山浦功 on 2018/07/25.
//  Copyright © 2018年 KoYamaura. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    
    var uniqueElements: Array<Element> {
        
        var seen: [Element:Bool] = [:]
        
        return self.compactMap({ (element) in
            guard seen[element] == nil else {
                return nil
            }
            
            seen[element] = true
            return element
        })
    }
}
