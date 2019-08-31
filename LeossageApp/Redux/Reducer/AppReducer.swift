//
//  AppReducer.swift
//  LeossageApp
//
//  Created by Yunus Emre Celebi on 30.08.2019.
//  Copyright © 2019 CLevel. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(authState: authReducer(action: action, state: state?.authState))
}
