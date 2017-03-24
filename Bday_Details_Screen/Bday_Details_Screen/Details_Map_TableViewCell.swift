//
//  Details_Map_TableViewCell.swift
//  Bday_Details_Screen
//
//  Created by Appinventiv on 24/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
import GoogleMaps

class Details_Map_TableViewCell: UITableViewCell, CLLocationManagerDelegate {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var googleMapView: GMSMapView!
    
    var locationManager = CLLocationManager()
    var didFindMyLocation = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        googleMapView.addObserver(self, forKeyPath: "myLocation", options: NSKeyValueObservingOptions.new, context: nil)
        
        self.loadMap()
        
    }

    func loadMap() {
        
        guard let location = locationManager.location?.coordinate else {
            return
        }
        
        print(location)
        
        let camera = GMSCameraPosition.camera(withLatitude: location.latitude, longitude: location.longitude, zoom: 6.0)
        
        self.googleMapView.camera = camera
        self.googleMapView.isMyLocationEnabled = true
        self.googleMapView.settings.myLocationButton = true
   
        // Creates a marker at your location on map.
        let locationMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
        locationMarker.map = self.googleMapView
        locationMarker.map = self.googleMapView
        locationMarker.icon = GMSMarker.markerImage(with: UIColor.blue)
        locationMarker.opacity = 0.75
        locationMarker.snippet = "Your Location"
        
    }

    private func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            googleMapView.isMyLocationEnabled = true
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if !didFindMyLocation {
        
            let myLocation: CLLocation = change![NSKeyValueChangeKey.newKey] as! CLLocation
            
            googleMapView.camera = GMSCameraPosition.camera(withTarget: myLocation.coordinate, zoom: 10.0)
            googleMapView.settings.myLocationButton = true
            
            didFindMyLocation = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
