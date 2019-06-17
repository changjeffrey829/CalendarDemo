//
//  ViewController.swift
//  CalendarDemo
//
//  Created by Jeffrey Chang on 6/15/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import UIKit
import EventKitUI

class CalendarViewController: UIViewController {
    let calendarView = CalenderView()
    
    var calendarViewModel: CalendarViewModel
    
    init(calendarDayViewModel: CalendarViewModel) {
        self.calendarViewModel = calendarDayViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.myCollectionView.delegate = self
        calendarView.myCollectionView.dataSource = self
        view = calendarView
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "launch event vc", style: .done, target: self, action: #selector(addNewEvent))
    }
    
    @objc private func addNewEvent() {
        let vc = EKEventEditViewController()
        vc.event = EKEvent(eventStore: EventKitService.shared.store)
        vc.eventStore = EventKitService.shared.store
        vc.editViewDelegate = EventKitService.shared
        present(vc, animated: true, completion: nil)
    }
}

extension CalendarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewModel = calendarViewModel.createDayViewModel(indexPath: indexPath)
        let vc = DayTableViewController(viewModel: viewModel)
        navigationController?.pushViewController(vc, animated: true )
    }
}

extension CalendarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calendarViewModel.dayCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? DateCVCell
        cell?.backgroundColor = UIColor.clear
        cell?.dateViewModel = calendarViewModel.createDateViewModel(indexPath: indexPath)
        return cell ?? DateCVCell()
    }
}
