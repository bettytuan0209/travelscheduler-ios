//
//  ViewController.swift
//  travelscheduler-ios
//
//  Created by Chiao-Yu Tuan on 6/3/17.
//  Copyright © 2017 Chiao-Yu Tuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var resultsTextView: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()

        let distanceMatrixClient = DistanceMatrixClient()
        let locations = ["GoldenGateBridge", "PalaceofFineArts", "CaliforniaAcademyofSciences"]
//        let locations = ["Washington,DC","Boston,MA"]
        distanceMatrixClient.getDistanceMatrix(locations: locations) { result in
            self.resultsTextView.text = result.removingPercentEncoding
        }

    }
}

