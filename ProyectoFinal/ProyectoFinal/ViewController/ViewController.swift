//
//  ViewController.swift
//  ProyectoFinal
//
//  Created by MAC01 on 5/06/18.
//  Copyright © 2018 Tecsup. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -16.430195, longitude: -71.519274, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -16.430195, longitude: -71.519274)
        marker.title = "Tecsup"
        marker.snippet = "Ubicacion"
        marker.map = mapView
    }

}

