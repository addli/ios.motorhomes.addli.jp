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
            let file:PlacesWrapper
            do {
                file = try PlacesWrapper("http://motorhomes.addli.jp/assets/json/places.json")
            }catch{
                if case let error as WebStruct.Error = error{
                    handler( nil, Error(reason:"\(error)") )
                }else{
                    handler( nil, Error(reason:"Unknown error.") )
                }
                return
            }
            handler( file.places, nil )
        }
    }
}
