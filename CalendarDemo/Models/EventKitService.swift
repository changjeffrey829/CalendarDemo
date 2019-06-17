//
//  EventKitService.swift
//  CalendarDemo
//
//  Created by Jeffrey Chang on 6/16/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import Foundation
import EventKit
import EventKitUI

class EventKitService: NSObject {
    
    static let shared = EventKitService()
    
    var store = EKEventStore()
    private override init() {}
    
    func showListOfEventsForDay(year: Int, month: Int, day: Int) -> [EKEvent] {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = 0
        let startDate = Calendar.current.date(from: dateComponents) ?? Date()
        dateComponents.hour = 24
        let endDate = Calendar.current.date(from: dateComponents) ?? Date()
        let searchPredicate = store.predicateForEvents(withStart: startDate, end: endDate, calendars: nil)
        return store.events(matching: searchPredicate)
    }
    
    func requestAccess() {
        store.requestAccess(to: .event) { (access, err) in
            if err != nil {return}
            if access {
                print("We got access")
            } else {
                print("We got denied")
            }
        }
    }
}

extension EventKitService: EKEventEditViewDelegate {
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: nil)
    }
}
