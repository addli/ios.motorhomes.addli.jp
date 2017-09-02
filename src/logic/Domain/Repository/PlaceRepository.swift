//
//  PlaceRepository.swift
//  motorhomes
//
//  Created by iq3AddLi on 2017/09/02.
//  Copyright © 2017年 addli.co.jp. All rights reserved.
//

import Foundation

protocol PlaceRepository{
    func loadPlace(handler:([Place],Error?) -> Void)
}

struct PlaceImplRepository : PlaceRepository {
    func loadPlace(handler:([Place],Error?) -> Void){
        handler([Place(title : "大分", type : "", postalCode : "", address : "大分県別府市", tel : "", url : "", location : Location(latitude:33.246942,longitude:131.653304))],nil)
    }
}
