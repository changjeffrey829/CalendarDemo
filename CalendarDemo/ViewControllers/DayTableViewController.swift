//
//  DayTableViewController.swift
//  CalendarDemo
//
//  Created by Jeffrey Chang on 6/15/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import UIKit
import EventKitUI

class DayTableViewController: UITableViewController {
    
    let dayViewModel: DayViewModel
    
    init(viewModel: DayViewModel) {
        self.dayViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = dayViewModel.navTitle
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: DayViewModel.cellID)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = EKEventEditViewController()
        vc.event = dayViewModel.eventAt(index: indexPath.row)
        vc.eventStore = EventKitService.shared.store
        vc.editViewDelegate = self
        present(vc, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayViewModel.eventsCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DayViewModel.cellID, for: indexPath)
        cell.textLabel?.text = dayViewModel.eventTitleAt(index: indexPath.row)
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DayTableViewController: EKEventEditViewDelegate {

    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        switch action.rawValue {
        case 1:
            dayViewModel.loadEventFromCalendar()
        case 2:
            dayViewModel.loadEventFromCalendar()
        default:
            controller.cancelEditing()
        }
        controller.dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
