//
//  AddEventView.swift
//  CalendarDemo
//
//  Created by Jeffrey Chang on 6/15/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import UIKit

class AddEventView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
    }
    
    private func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleTextfield, descriptionTextView, startDatePicker, endDatePicker, UIView()])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
    
    let titleTextfield: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Title"
        tf.font = UIFont(name: tf.font!.fontName, size: 18)
        tf.textAlignment = .center
        return tf
    }()
    
    let descriptionTextView: UITextView = {
        let tf = UITextView()
        tf.allowsEditingTextAttributes = true
        tf.text = "Description"
        tf.font = UIFont(name: tf.font!.fontName, size: 14)
        tf.isScrollEnabled = false
        tf.textColor = .lightGray
        return tf
    }()
    
    let startDatePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = UIDatePicker.Mode.dateAndTime
        dp.minimumDate = Date().addingTimeInterval(TimeInterval(4.0 * 60.0 * 60.0))
        dp.timeZone = Calendar.current.timeZone
        return dp
    }()
    
    let endDatePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = UIDatePicker.Mode.dateAndTime
        dp.minimumDate = Date().addingTimeInterval(TimeInterval(4.0 * 60.0 * 60.0))
        dp.timeZone = Calendar.current.timeZone
        return dp
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


