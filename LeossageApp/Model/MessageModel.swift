//
//  MessageModel.swift
//  LeossageApp
//
//  Created by Yunus Emre Celebi on 30.08.2019.
//  Copyright © 2019 CLevel. All rights reserved.
//

import Foundation

struct MessageModel: Codable {
    let id: Int?
    let user: UserModel?
    let text: String?
    let timeStamp: UInt64?
}


struct MessageResponse: Codable {
    let messageList: [MessageModel]?
}
