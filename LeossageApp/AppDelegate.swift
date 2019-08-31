//
//  AppDelegate.swift
//  LeossageApp
//
//  Created by Yunus Emre Celebi on 30.08.2019.
//  Copyright © 2019 cLB. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setRootViewController()
        return true
    }

    func setRootViewController(viewController: BaseViewController = LoginViewController.getInstance()) {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        navigationController.viewControllers = [viewController]
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
    }

}

