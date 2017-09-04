//
//  PlaceRepository.swift
//  motorhomes
//
//  Created by iq3AddLi on 2017/09/02.
//  Copyright © 2017年 addli.co.jp. All rights reserved.
//

import Foundation

import WebStruct

protocol PlaceRepository{
    func loadPlace(handler:@escaping ([Place]?,Error?) -> Void)
}

struct PlaceImplRepository : PlaceRepository {

    func loadPlace(handler:@escaping ([Place]?,Error?) -> Void){

        DispatchQueue.global().async {
            let file:PlacesFile
            do {
                file = try PlacesFile("http://motorhomes.addli.jp/assets/json/places.json")
            }catch{
                handler( nil, error as? Error )
                return
            }
            handler( file.places, nil )
        }
    }
}
