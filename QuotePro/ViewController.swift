//
//  ViewController.swift
//  QuotePro
//
//  Created by Jaison Bhatti on 2017-10-11.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let quoteView: QuoteView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteView = Bundle.main.loadNibNamed("QuoteView", owner: nil)?.first as? QuoteView
        view = quoteView
        quoteView.cameraButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
    }
    
    func buttonTapped(sender: UIButton) {
        
    }

}

