//
//  Extension.swift
//  EventKitDemo
//
//  Created by Jeffrey Chang on 6/17/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import Foundation

//get first day of the month
extension Date {
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    var firstDayOfTheMonth: Date {
        let dateComponents = Calendar.current.dateComponents([.year,.month], from: self)
        return Calendar.current.date(from: dateComponents) ?? Date()
    }
}

//get date from string
extension String {
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var date: Date? {
        return String.dateFormatter.date(from: self)
    }
}
