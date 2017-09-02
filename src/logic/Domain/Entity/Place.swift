//
//  Place.swift
//  motorhomes
//
//  Created by iq3AddLi on 2017/09/02.
//  Copyright © 2017年 addli.co.jp. All rights reserved.
//

import Foundation

struct Place{
    let title : String
    let type : String
    let postalCode : String
    let address : String
    let tel : String
    let url : String
    let location : Location
}

extension Place : CustomStringConvertible{
    public var description: String {
        return "\(title) [\(location)]"
    }
}
