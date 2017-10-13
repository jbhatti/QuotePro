//
//  PhotoAPIManager.swift
//  QuoteProStarter
//
//  Created by Jaison Bhatti on 2017-10-11.
//  Copyright © 2017 steve. All rights reserved.
//

import UIKit



class PhotoAPIManager {
    
    static func getImage (completion: @escaping (UIImage) -> Void) {
        let imageAddress = "http://lorempixel.com/200/300/abstract/"
        let url = URL(string: imageAddress)!
        URLSession.shared.dataTask(with: url)
        { (data, response, error) in
            if error != nil
            {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            let randomImage = UIImage(data:data)
            
            completion(randomImage!)
            
            }.resume()

    }

}




