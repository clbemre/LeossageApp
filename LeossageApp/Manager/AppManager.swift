//
//  AppManager.swift
//  LeossageApp
//
//  Created by Yunus Emre Celebi on 31.08.2019.
//  Copyright © 2019 CLevel. All rights reserved.
//

import Foundation
import DefaultsKit

class AppManager {

    var defaults: Defaults? = nil

    private init() {
        defaults = Defaults()
    }

    static let shared = AppManager()

    // Splash Screen Url
    public func setUsername(userName: String?) {
        self.defaults?.clear(.KEY_USERNAME)
        self.defaults?.set(userName ?? "", for: .KEY_USERNAME)
    }

    public func getUserName() -> String? {
        return self.defaults?.get(for: .KEY_USERNAME)
    }

    public func removeUserName() {
        self.defaults?.clear(.KEY_USERNAME)
    }
}

extension DefaultsKey {
    static let KEY_USERNAME = Key<String>("userName")
}
