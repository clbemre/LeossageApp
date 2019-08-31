//
//  LoginProvider.swift
//  LeossageApp
//
//  Created by Yunus Emre Celebi on 30.08.2019.
//  Copyright © 2019 CLevel. All rights reserved.
//

import Foundation

class LoginProvider {

    static func login(user: String?, completion: @escaping (String, String?) -> Void) {
        guard let userName = user, userName.count > 2 else {
            completion(user ?? "nilUser", "Hatalı kullanıcı adı")
            return
        }
        AppManager.shared.setUsername(userName: userName)
        completion(userName, nil)
    }
}
