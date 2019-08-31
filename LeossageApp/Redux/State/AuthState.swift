//
//  AuthState.swift
//  LeossageApp
//
//  Created by Yunus Emre Celebi on 30.08.2019.
//  Copyright © 2019 CLevel. All rights reserved.
//

import Foundation
import ReSwift

struct AuthState: StateType {
    var userName: String?
    var errorMessage: String?
    var signInState: SignInState = .idle
}

enum SignInState {
    case idle
    case notLoggedIn
    case loggedIn
}

