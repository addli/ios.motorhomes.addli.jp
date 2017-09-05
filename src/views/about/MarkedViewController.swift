//
//  MarkedViewController.swift
//  motorhomes
//
//  Created by iq3AddLi on 2017/09/05.
//  Copyright © 2017年 addli.jp. All rights reserved.
//

import Foundation

import MarkdownView
import WebStruct

class MarkedViewController: UIViewController {
    
    @IBOutlet var markedView:MarkdownView!
    
    public var file:String = "about-this-app.md"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        markedView.onTouchLink = { request in
            if let url = request.url{
                UIApplication.shared.openURL( url )
            }
            return false
        }
        
        DispatchQueue.global().async {
            
            let markdown:MarkdownWrapper?
            markdown = try? MarkdownWrapper("http://motorhomes.addli.jp/assets/markdown/\( Locale.preferredLanguages.first!.hasPrefix("ja") ? "ja" : "en" )/\( self.file )")
            
            DispatchQueue.main.sync {
                self.markedView.load(markdown: markdown != nil ? markdown!.text : "# Sorry. Document is not found.")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
