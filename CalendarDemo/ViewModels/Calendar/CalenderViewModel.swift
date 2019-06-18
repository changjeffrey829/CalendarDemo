//
//  CalenderViewModel.swift
//  EventKitDemo
//
//  Created by Jeffrey Chang on 6/17/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import Foundation
import EventKit

class CalendarViewModel {
    private var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    private var currentMonthIndex: Int = 0
    private var currentYear: Int = 0
    private var presentMonthIndex = 0
    private var presentYear = 0
    private var todaysDate = 0
    private var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)
    private let service: EventKitService
    
    init(service: EventKitService = EventKitService.shared) {
        self.service = service
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        firstWeekDayOfMonth = getFirstWeekDay()
        
        //for leap years, make february month of 29 days
        if currentMonthIndex == 2 && currentYear % 4 == 0 {
            numOfDaysInMonth[currentMonthIndex-1] = 29
        }
        presentMonthIndex = currentMonthIndex
        presentYear = currentYear
    }
    
    func createDayViewModel(indexPath: IndexPath) -> DayViewModel {
        return DayViewModel(navTitle: "\(presentMonthIndex) / \(indexPath.item - firstWeekDayOfMonth + 2)", year: currentYear, month: presentMonthIndex, day: indexPath.item - firstWeekDayOfMonth + 2)
    }
    
    func dayCount() -> Int {
        return numOfDaysInMonth[currentMonthIndex - 1] + firstWeekDayOfMonth - 1
    }
    
    func changeMonth(monthIndex: Int, year: Int) {
        currentMonthIndex = monthIndex + 1
        currentYear = year
        
        //for leap year, make february month of 29 days
        if monthIndex == 1 {
            if currentYear % 4 == 0 {
                numOfDaysInMonth[monthIndex] = 29
            } else {
                numOfDaysInMonth[monthIndex] = 28
            }
        }
        
        firstWeekDayOfMonth = getFirstWeekDay()
    }
    
    func createDateViewModel(indexPath: IndexPath) -> DateViewModel {
        return DateViewModel(indexPath: indexPath, firstWeekDayOfMonth: firstWeekDayOfMonth, todaysDate: todaysDate, currentYear: currentYear, presentYear: presentYear, currentMonthIndex: currentMonthIndex, presentMonthIndex: presentMonthIndex)
    }
    
    func shouldLeftMonthButtonEnable() -> Bool {
        return !(currentMonthIndex == presentMonthIndex && currentYear == presentYear)
    }
    
    func getFirstWeekDay() -> Int {
        let day = ("\(currentYear)-\(currentMonthIndex)-01".date?.firstDayOfTheMonth.weekday)!
        return day
    }
}
