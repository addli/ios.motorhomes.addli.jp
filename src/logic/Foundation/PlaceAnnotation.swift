//
//  PlaceAnnotation.swift
//  motorhomes
//
//  Created by iq3AddLi on 2017/09/02.
//  Copyright © 2017年 addli.jp. All rights reserved.
//

import MapKit

class PlaceAnnotation : MKPointAnnotation{
    let place:Place
    
    init(place:Place){
        self.place = place
    }
}
