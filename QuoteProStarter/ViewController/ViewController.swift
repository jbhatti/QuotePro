//
//  ViewController.swift
//  QuoteProStarter
//
//  Created by steve on 2017-10-10.
//  Copyright © 2017 steve. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var quoteView: QuoteView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateQuoteAndImage()
        
        quoteView = Bundle.main.loadNibNamed("QuoteView", owner: nil)?.first as? QuoteView
        view = quoteView
        quoteView.cameraButton.addTarget(self, action: #selector(buttonTapped(sender:)) , for: .touchUpInside)
        quoteView.randomize.addTarget(self, action: #selector(randomizeTapped(sender:)) , for: .touchUpInside)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        Singleton.sharedInstance.addToList(image: self.quoteView.imageView.image!)
        Singleton.sharedInstance.addToList(quote: self.quoteView.label.text!)
    }
    
    func generateQuoteAndImage() {
        
        PhotoAPIManager.getImage { (image) in
            OperationQueue.main.addOperation {
                self.quoteView.imageView.image = image
                //Singleton.sharedInstance.addToList(image: image)
            }
        }
        
        QuotesAPIManager.getQuote { (quote) in
            OperationQueue.main.addOperation {
                self.quoteView.label.text = quote.quoteText
                self.quoteView.label.sizeToFit()
                self.quoteView.authorLabel.text = quote.quoteAuthor
                //Singleton.sharedInstance.addToList(quote: quote.quoteText)
            }
        }
    }
    
    
    @objc func randomizeTapped(sender: UIButton) {
            generateQuoteAndImage()
    }
    
    @objc func buttonTapped(sender: UIButton) {
        
        
        guard let image = UIImage.snapshot(view: quoteView) else {
            fatalError()
        }
        let activity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activity, animated: true)
    }
}

extension UIImage {
    static func snapshot(view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}



