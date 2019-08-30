//
//  LApi.swift
//  LeossageApp
//
//  Created by Yunus Emre Celebi on 30.08.2019.
//  Copyright © 2019 CLevel. All rights reserved.
//

import Foundation

struct LApiPagedResult<T: Codable>: Codable {

    let results: [T]

    private enum CodingKeys: String, CodingKey {
        case results
    }
}

protocol LApiFetcher {
    func fetchAllMessage(completion: @escaping (MessageResponse?) -> Void)
}

class LApi: LApiFetcher {

    let baseUrl = "https://jsonblob.com/api/"
    let messagesUrl = "jsonBlob/4f421a10-5c4d-11e9-8840-0b16defc864d"

    func fetchAllMessage(completion: @escaping (MessageResponse?) -> Void) {
        fetch(url: "\(baseUrl)\(messagesUrl)", completion: completion)
    }

    func fetch<T: Codable>(url: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: url) else { return completion(nil) }

        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard
                let data = data,
                let obj = try? JSONDecoder().decode(T.self, from: data)
                else {
                    return completion(nil)
            }

            completion(obj)
        }

        task.resume()
    }
}
