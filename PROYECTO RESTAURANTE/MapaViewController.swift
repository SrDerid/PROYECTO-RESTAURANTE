//
//  MapaViewController.swift
//  PROYECTO RESTAURANTE
//
//  Created by jean carlos on 21/06/23.
//  Copyright © 2023 CibertecTeam. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let anotacionTrujillo = CLLocationCoordinate2D(latitude: -8.111840, longitude: -79.028671)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       mapView.overrideUserInterfaceStyle =  .dark
       mapView.isZoomEnabled = true
       
        //ajustes a ubicacion de mapa - jc
        
       let annotation = MKPointAnnotation()
       annotation.coordinate = anotacionTrujillo
       annotation.title = "Ciudad de Trujillo"
       annotation.subtitle = "Ciudad de la Primavera "
       
       mapView.addAnnotation(annotation)
       
       let camera = MKMapCamera(lookingAtCenter: anotacionTrujillo, fromEyeCoordinate: anotacionTrujillo, eyeAltitude: 2000.0)
       mapView.setCamera(camera, animated: true)
        
    }

}
