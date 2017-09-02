//
//  Location.swift
//  motorhomes
//
//  Created by iq3AddLi on 2017/09/02.
//  Copyright © 2017年 addli.jp. All rights reserved.
//

import Foundation

struct Location{
    let latitude : Double
    let longitude : Double
}

extension Location : CustomStringConvertible{
    public var description: String {
        return "\(latitude),\(longitude)"
    }
}
