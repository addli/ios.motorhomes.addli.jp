//
//  MapService.swift
//  motorhomes
//
//  Created by iq3AddLi on 2017/09/02.
//  Copyright © 2017年 addli.co.jp. All rights reserved.
//

import Foundation

import MapKit

struct MapService{
    
    let placeRepo:PlaceRepository = PlaceImplRepository()
    
    func loadPlace(handler:([Place],Error?) -> Void){
        placeRepo.loadPlace(handler:handler)
    }
}
