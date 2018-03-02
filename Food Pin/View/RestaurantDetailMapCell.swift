//
//  RestaurantDetailMapCell.swift
//  Food Pin
//
//  Created by Timothy Moore on 2/28/18.
//  Copyright © 2018 Tim Moore. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
    
    @IBOutlet var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(location: String) {
        // Get location
        let geocoder = CLGeocoder()
        
        print(location)
        geocoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    // Display the annotation
                    annotation.coordinate = location.coordinate
                    
                    self.mapView.addAnnotation(annotation)
                    
                    // Set zoom level
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                    self.mapView.setRegion(region, animated: false)
                }
            }
            
        })
    }
}
