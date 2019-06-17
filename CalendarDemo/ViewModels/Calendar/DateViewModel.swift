//
//  DateViewModel.swift
//  EventKitDemo
//
//  Created by Jeffrey Chang on 6/17/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import Foundation

class DateViewModel {
    
    private let indexPath: IndexPath
    private let firstWeekDayOfMonth: Int
    private let todaysDate: Int
    private let currentYear: Int
    private let presentYear: Int
    private let currentMonthIndex: Int
    private let presentMonthIndex: Int
    
    init(indexPath: IndexPath, firstWeekDayOfMonth: Int, todaysDate: Int, currentYear: Int, presentYear: Int, currentMonthIndex: Int, presentMonthIndex: Int) {
        self.indexPath = indexPath
        self.firstWeekDayOfMonth = firstWeekDayOfMonth
        self.todaysDate = todaysDate
        self.currentYear = currentYear
        self.presentYear = presentYear
        self.currentMonthIndex = currentMonthIndex
        self.presentMonthIndex = presentMonthIndex
    }
    
    func shouldHideDateCell() -> Bool {
        return indexPath.item <= firstWeekDayOfMonth - 2 ? true : false
    }
    
    func calcuateDateString() -> String {
        let calcDate = indexPath.row - firstWeekDayOfMonth + 2
        return String(calcDate)
    }
    
    func shouldUserInteractionEnable() -> Bool {
        let calcDate = indexPath.row - firstWeekDayOfMonth + 2
        return calcDate < todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex ? false : true
    }
}
