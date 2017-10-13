//
//  Singleton.swift
//  QuoteProStarter
//
//  Created by Jaison Bhatti on 2017-10-12.
//  Copyright © 2017 steve. All rights reserved.
//

import UIKit

class QuoteDataSingleton {
    
    static let sharedInstance = QuoteDataSingleton()
    
    var arrayOfQuotes: [String] = []
    var arrayOfImages: [UIImage] = []
    
    
    func addToList(quote: String) {
        arrayOfQuotes.append(quote)
    }
    
    func addToList(image: UIImage) {
        arrayOfImages.append(image)
    }
    
    private init() {
        print("Singleton initialized")
    }
    
}




