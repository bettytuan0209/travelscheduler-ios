//
//  NetworkRequestClient.swift
//  travelscheduler-ios
//
//  Created by Chiao-Yu Tuan on 6/3/17.
//  Copyright © 2017 Chiao-Yu Tuan. All rights reserved.
//

import Foundation

class NetworkRequestClient {
//    private static let defaultSession = URLSession(configuration: URLSessionConfiguration.default)

    public static func sendRequest(url: URL,
                            completion: ((Data?, URLResponse?, Error?) -> ())? = nil) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion?(data, response, error)
            }
        }
        
        task.resume()

    }
}
