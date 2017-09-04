//
//  CalloutDetailView.swift
//  motorhomes
//
//  Created by iq3AddLi on 2017/09/02.
//  Copyright © 2017年 addli.jp. All rights reserved.
//

import UIKit

class CalloutDetailView : UIView{
    
    @IBOutlet var addressLabel:UILabel!
    @IBOutlet var urlLabel:UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let widthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 261)
        self.addConstraint(widthConstraint)
        
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 42)
        self.addConstraint(heightConstraint)
    }
    
    func set(place:Place) {
        self.addressLabel.text = place.address
        self.urlLabel.text = place.url
    }
}
