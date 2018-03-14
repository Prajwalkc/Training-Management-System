//
//  eSmartNewsViewController.swift
//  Training Management System
//
//  Created by Prajwal kc on 3/1/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

class eSmartNewsViewController: UIViewController,UITableViewDelegate {
    @IBAction func myCancelButton(_ sender: Any) {
   dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    @IBOutlet weak var myBody: UILabel!
    
    
    
    @IBOutlet weak var myTitle: UILabel!
    var newsIndex = Int()
    var contents : [eSmartNews] = []
    @IBOutlet weak var imgProfile: UIImageView!
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(newsIndex)
           myTitle.text = contents[newsIndex].content_title
      let url = URL(string: contents[newsIndex].featured_img!)
       imgProfile.kf.setImage(with: url)
    myBody.text = self.contents[newsIndex].content_body?.html2String
        myBody.preferredMaxLayoutWidth = 700
        myBody.sizeToFit()
        
        
   
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
        // Dispose of any resources that can be recreated.
    }
 


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


   
  
   
    
}
extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
