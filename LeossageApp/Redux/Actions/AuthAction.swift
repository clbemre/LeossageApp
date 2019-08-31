//
//  AuthAction.swift
//  LeossageApp
//
//  Created by Yunus Emre Celebi on 30.08.2019.
//  Copyright © 2019 CLevel. All rights reserved.
//

import Foundation
import ReSwift

extension AuthState {
    public static func authenticateUser(mUserName: String?) -> Store<AppState>.ActionCreator {
        return { state, store in

            if let oldSession = AppManager.shared.getUserName(), oldSession.count > 0 {
                store.dispatch(LoginAction(userName: oldSession))
                print("// old Session çalıştı")
                return nil
            }

            print("// Buraya geçmedi")
            // TODO : save session
            LoginProvider.login(user: mUserName, completion: { (username, error) in
                if let error = error {
                    store.dispatch(ErrorAuthAction(errorMessage: error))
                } else {
                    store.dispatch(LoginAction(userName: mUserName))
                }
            })
            return nil
        }
    }
}

struct LoginAction: Action {
    let userName: String?
}

struct ErrorAuthAction: Action {
    let errorMessage: String
}
