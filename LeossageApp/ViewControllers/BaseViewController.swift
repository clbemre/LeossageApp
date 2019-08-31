//
//  BaseViewController.swift
//  LeossageApp
//
//  Created by Yunus Emre Celebi on 30.08.2019.
//  Copyright © 2019 CLevel. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.initialComponents()
        self.registerEvents()
    }

    func setupView() {
        preconditionFailure("setupView - This method must be overridden")
    }

    func initialComponents() {
        preconditionFailure("initialComponents - This method must be overridden")
    }

    func registerEvents() {
        preconditionFailure("registerEvents - This method must be overridden")
    }

    func showErrorAlert(title: String = "Error", message: String = "", handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: handler))
        self.present(alertController, animated: true, completion: nil)
    }

}
