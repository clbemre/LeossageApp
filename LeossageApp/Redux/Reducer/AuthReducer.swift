//
//  AuthReducer.swift
//  LeossageApp
//
//  Created by Yunus Emre Celebi on 30.08.2019.
//  Copyright © 2019 CLevel. All rights reserved.
//

import ReSwift

func authReducer(action: Action, state: AuthState?) -> AuthState {

    var state = state ?? AuthState()
    switch action {
    case let action as LoginAction:
        state.userName = action.userName
        state.errorMessage = nil
        state.signInState = .loggedIn
    case let action as ErrorAuthAction:
        state.errorMessage = action.errorMessage
        state.signInState = .notLoggedIn
    default:
        break
    }

    return state
}
