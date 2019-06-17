//
//  DayViewModel.swift
//  CalendarDemo
//
//  Created by Jeffrey Chang on 6/15/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import Foundation
import EventKit

class DayViewModel {
    static let cellID = "DayCellID"
    
    private var events = [EKEvent]()
    private (set) var navTitle: String
    private let service: EventKitService
    private let year: Int
    private let month: Int
    private let day: Int
    
    init(navTitle:String, year: Int, month: Int, day: Int, service: EventKitService = EventKitService.shared) {
        self.year = year
        self.month = month
        self.day = day
        self.service = service
        self.navTitle = navTitle
        let events = service.showListOfEventsForDay(year: year, month: month, day: day)
        self.events = events
    }
    
    func eventsCount() -> Int {
        return events.count
    }
    func eventAt(index: Int) -> EKEvent {
        return events[index]
    }
    
    func eventTitleAt(index: Int) -> String {
        return events[index].title
    }
    
    func loadEventFromCalendar() {
        let events = service.showListOfEventsForDay(year: year, month: month, day: day)
        self.events = events
    }
}
