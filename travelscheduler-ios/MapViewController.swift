//
//  MapViewController.swift
//  travelscheduler-ios
//
//  Created by Chiao-Yu Tuan on 6/4/17.
//  Copyright © 2017 Chiao-Yu Tuan. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    public override func loadView() {
        super.loadView()

        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}
