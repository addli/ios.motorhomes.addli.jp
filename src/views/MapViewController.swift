//
//  ViewController.swift
//  motorhomes
//
//  Created by iq3AddLi on 2017/08/25.
//  Copyright © 2017年 +Li, Inc. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    let service = MapService()
    
    @IBOutlet var mapView:MKMapView!
    
    lazy var callOutView:CalloutDetailView = {
        guard case let callOutView as CalloutDetailView = Bundle.main.loadNibNamed("CalloutDetailView", owner:self, options:nil)?[0] else{
            fatalError("CalloutDetailView not contain in xib.")
        }
        return callOutView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.loadPlace( handler:{ (places,error) in
            
            places.forEach({ (place) in
                let annotation = PlaceAnnotation(place: place)
                annotation.coordinate = CLLocationCoordinate2DMake(place.location.latitude, place.location.longitude)
                annotation.title = place.title
                annotation.subtitle = "\(place.location)"
                mapView.addAnnotation(annotation)
            })
        })
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear( animated )
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension MapViewController : MKMapViewDelegate{
    
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        
        let identifier = "PinAnnotationIdentifier"
        var pin = mapView.dequeueReusableAnnotationView(withIdentifier: identifier )
        
        if pin == nil {
            let view = MKPinAnnotationView.init(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            
            let callOutView = self.callOutView
            if case let anno as PlaceAnnotation = annotation{
                callOutView.addressLabel.text = anno.place.address
            }
            view.detailCalloutAccessoryView = callOutView
            pin = view
        }
        
        pin?.annotation = annotation
        return pin
    }
}
