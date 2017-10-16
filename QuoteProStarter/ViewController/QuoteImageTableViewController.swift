//
//  QuoteImageTableViewController.swift
//  QuoteProStarter
//
//  Created by Jaison Bhatti on 2017-10-12.
//  Copyright © 2017 steve. All rights reserved.
//

import UIKit

class QuoteImageTableViewController: UITableViewController {
    
    //let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //var quotes: [Quote] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return QuoteDataSingleton.sharedInstance.arrayOfQuotes.count
        //return quotes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? QuoteImageTableViewCell
        else
        { fatalError() }
        
        let image = QuoteDataSingleton.sharedInstance.arrayOfImages[indexPath.row]
        let quote = QuoteDataSingleton.sharedInstance.arrayOfQuotes[indexPath.row]
        
//        let quote = quotes[indexPath.row]
//
//        if let myQuote = quote.quoteText {
//            cell.quoteText.text = myQuote
//        }
        
        cell.quoteText.text = quote
        cell.importImageView.image = image
        
        return cell
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        getData()
//        tableView.reloadData()
//    }
//
//    func getData() {
//        do {
//            quotes = try context.fetch(Quote.fetchRequest())
//        } catch {
//            print("Fetching Failed")
//        }
//    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
