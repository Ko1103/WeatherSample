//
//  NSDate+Extensions.swift
//  WeatherSample
//
//  Created by 山浦功 on 2018/07/24.
//  Copyright © 2018年 KoYamaura. All rights reserved.
//

import Foundation

extension Date {
    
    //e.g. 10:30
    func formattedTime(formatter: DateFormatter) -> String {
        formatter.setLocalizedDateFormatFromTemplate("HH:mm")
        return formatter.string(from: self)
    }
    
    // e.g. 19/9
    func formattedDay(formatter: DateFormatter) -> String {
        formatter.setLocalizedDateFormatFromTemplate("d M")
        return formatter.string(from: self)
    }
    
    // e.g. Sunday
    func dayOfWeek(formatter: DateFormatter) -> String {
        formatter.setLocalizedDateFormatFromTemplate("EEEE")
        return formatter.string(from: self)
    }
}

extension Date: Comparable {}

public func ==(lhs: Date, rhs: Date) -> Bool {
    switch lhs.compare(rhs) {
    case .orderedSame:
        return true
    default:
        return false
    }
}

public func <(lhs: Date, rhs: Date) -> Bool {
    switch lhs.compare(rhs) {
    case .orderedAscending:
        return true
    default:
        return false
    }
}
