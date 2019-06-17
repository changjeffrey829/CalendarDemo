//
//  AppDelegate.swift
//  CalendarDemo
//
//  Created by Jeffrey Chang on 6/15/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        let viewModel = CalendarViewModel()
        let viewController = CalendarViewController(calendarDayViewModel: viewModel)
        let navController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navController
        return true
    }
}

