//
//  LoginViewController.swift
//  LeossageApp
//
//  Created by Yunus Emre Celebi on 30.08.2019.
//  Copyright © 2019 CLevel. All rights reserved.
//

import UIKit
import SnapKit
import GestureRecognizerClosures
import ReSwift

class LoginViewController: BaseViewController, StoreSubscriber {

    typealias StoreSubscriberStateType = AuthState

    static func getInstance() -> LoginViewController {
        return LoginViewController()
    }

    override func setupView() {
        self.view.backgroundColor = .white
        self.setupTextFieldUserName()
        self.setupLoginButton()
    }

    override func initialComponents() {

    }

    override func registerEvents() {
        self.loginButton.onTap { _ in
            store.dispatch(AuthState.authenticateUser(mUserName: self.tfUserName.text))
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self) {
            $0.select {
                $0.authState
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // TODO CHECK SESSION
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }

    func newState(state: AuthState) {
        if state.signInState == .notLoggedIn {
            self.showErrorAlert(message: state.errorMessage ?? "-1")
        }
    }

    // User Name TextField
    let tfUserName: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please enter the username"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.rgb(red: 111, green: 168, blue: 220).cgColor
        return textField
    }()

    // Login Button
    let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.rgb(red: 111, green: 168, blue: 220)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.rgb(red: 45, green: 115, blue: 175).cgColor
        return button
    }()

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.tfUserName.resignFirstResponder()
    }

}


// MARKS: - Setup UI
extension LoginViewController {

    func setupTextFieldUserName() {
        self.view.addSubview(self.tfUserName)
        self.tfUserName.snp.makeConstraints { (maker) in
            maker.leading.equalToSuperview().offset(24)
            maker.trailing.equalToSuperview().offset(-24)
            maker.height.equalTo(40.0)
            maker.center.equalToSuperview()
        }

        self.tfUserName.delegate = self
    }

    func setupLoginButton() {
        self.view.addSubview(self.loginButton)
        self.loginButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.tfUserName.snp.bottom).offset(24)
            maker.height.equalTo(45.0)
            maker.leading.trailing.equalTo(self.tfUserName)
        }
    }
}

// MARKS: - UITextfieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tfUserName.resignFirstResponder()
        return true
    }
}
