//
//  Thunk.swift
//  LeossageApp
//
//  Created by Yunus Emre Celebi on 30.08.2019.
//  Copyright © 2019 CLevel. All rights reserved.
//

import Foundation
import ReSwift

public struct Thunk<State>: Action {
    let body: (_ dispatch: @escaping DispatchFunction, _ getState: @escaping () -> State?) -> Void
    public init(body: @escaping (
        _ dispatch: @escaping DispatchFunction,
        _ getState: @escaping () -> State?) -> Void) {
        self.body = body
    }
}

@available(*, deprecated, renamed: "Thunk")
typealias ThunkAction = Thunk
