//
//  eSmartTableViewController.swift
//  Training Management System
//
//  Created by Prajwal kc on 2/28/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.

import UIKit
import Alamofire
import Kingfisher


class eSmartTableViewController: UITableViewController {
    @IBOutlet var myTableView: UITableView!
    var content :[eSmartNews] = []
    
    override func viewDidLoad() {
                super.viewDidLoad()
        self.navigationItem.title = "News "
        fetchData()
            }

   
    @available(iOS 2.0, *)
override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
   // let eSmart = eSmartNewsViewController()
      let eSmartVC =  self.storyboard?.instantiateViewController(withIdentifier: "eSmartVC") as! eSmartNewsViewController
        eSmartVC.newsIndex = indexPath.row
        eSmartVC.contents = content
        self.navigationController?.present(eSmartVC, animated: true, completion: nil)
            //eSmart.contents[indexPath.row] = self.content[indexPath.row]
              //     eSmart.newsIndex = indexPath.row
        
//
//
//        performSegue(withIdentifier: "ShowNews", sender: self )
//

    }
   

    func fetchData(){
        let param : [String:Any] = ["token":"147258369123456789","content_type":"News"]
        Alamofire.request("http://esmart.almawadait.com/api/content/lists", method: .post, parameters: param).responseJSON { (response) in
            if let dict = response.value as? NSDictionary{
                if let contentArray = dict["records"] as? NSArray {
                    for eachElement in contentArray {
                        if let contentDict = eachElement as? NSDictionary{
                          self.content.append(eSmartNews.init(json: contentDict))
                            
                        }
                    }
                    
                }
            }
            self.myTableView.reloadData()

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return content.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eSmartTVC", for: indexPath) as! eSmartTableViewCell
        cell.myContent_title_ar.text = content[indexPath.row].content_title_ar
        cell.myContent_title.text = content[indexPath.row].content_title
       cell.myContent_url.text = content[indexPath.row].content_url
        let url = URL(string: content[indexPath.row].featured_img!)
        cell.myCellImage.kf.setImage(with: url)
       cell.myCellImage.layer.cornerRadius = cell.myCellImage.layer.frame.width/2
        cell.myCellImage.clipsToBounds = true
        return cell
    }

// 

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
    // MARK: - Navigation
   

}
