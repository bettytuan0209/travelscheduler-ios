//
//  DistanceMatrixClient.swift
//  travelscheduler-ios
//
//  Created by Chiao-Yu Tuan on 6/3/17.
//  Copyright © 2017 Chiao-Yu Tuan. All rights reserved.
//

import Foundation

class DistanceMatrixClient: GoogleAPIBaseClient {
    public func getDistanceMatrix(locations: [String], completion: @escaping (String) -> Void) {
        let locationsString = locations.joined(separator: "|")

        let urlString = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial" +
            "&origins=\(locationsString)" +
            "&destinations=\(locationsString)" +
        "&key=\(GoogleAPIBaseClient.apiKey)"

        let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        
        print("Distance Matrix Client request: \(url!)")

        NetworkRequestClient.sendRequest(url: url!) { data, response, error in
            guard error == nil else {
                completion("\(error)")
                return
            }
            guard let data = data else {
                completion("Data is empty")
                return
            }

            guard let response = response as? HTTPURLResponse else {
                completion("response is not http response")
                return
            }

            if (response.statusCode != 200) {
                completion("Status code: \(response.statusCode)")
            } else {
                let json = try! JSONSerialization.jsonObject(with: data, options: [])
                completion("\(json)")
            }
        }
    }

}
