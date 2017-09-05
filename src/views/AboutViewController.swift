//
//  AboutViewController.swift
//  motorhomes
//
//  Created by iq3AddLi on 2017/09/02.
//  Copyright © 2017年 +Li, Inc. All rights reserved.
//

import UIKit

class AboutViewController: UITableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard case let nextVC as MarkedViewController = segue.destination
            else{ fatalError("Next scene is not MarkedViewController.") }
        
        guard let identifier = segue.identifier
            else{ fatalError("Segue identifier is empty.") }
        
        switch identifier {
        case "toAboutThisApp":
            nextVC.file = "about-this-app.md"
        case "toOpenSourceLicenses":
            nextVC.file = "licenses.md"
        default:
            fatalError("\(identifier) is not expected indentifier.")
        }
    }
}
