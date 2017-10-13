//
//  QuotesAPIManager.swift
//  QuoteProStarter
//
//  Created by Jaison Bhatti on 2017-10-11.
//  Copyright © 2017 steve. All rights reserved.
//

import UIKit

class QuotesAPIManager {
    
    struct Quote: Codable {
        let quoteAuthor: String
        let quoteText: String
    }
    
    
    static func getQuote (completion: @escaping (_ quote: Quote) -> Void) {
        let quoteAddress = "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json"
        let url = URL(string: quoteAddress)!
        URLSession.shared.dataTask(with: url)
        { (data, response, error) in
            if error != nil
            {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do
            {
                let jsonDecoder = JSONDecoder()
                let randomQuote = try jsonDecoder.decode(Quote.self, from: data)
                print(randomQuote)
                
                
                completion(randomQuote)
            }
            catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
        
    }
    
}
