//
//  Redux.swift
//  LeossageApp
//
//  Created by Yunus Emre Celebi on 30.08.2019.
//  Copyright © 2019 CLevel. All rights reserved.
//

import ReSwift

var store: Store<AppState> = Store<AppState>(reducer: appReducer, state: nil)
