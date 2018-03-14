//
//  CoursesTableViewController.swift
//  Training Management System
//
//  Created by Prajwal kc on 3/5/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
import Kingfisher
import FirebaseDatabase
import Firebase


class CoursesTableViewController: UITableViewController {
var course_list :[Course] = []
    override func viewDidLoad() {
        
        super.viewDidLoad()
         fetchCourses()
        self.navigationItem.title = "Courses Currently Availabel"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBOutlet var myTableView: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(course_list.count)
        return course_list.count
       
    }
    func fetchCourses()  {
        
        Database.database().reference().child("Courses").observe(.childAdded, with: { (snapshot) in
            let dict = snapshot.value as! NSDictionary
            self.course_list.append(Course.init(json: dict))
           
            
            
            self.myTableView.reloadData()
        })
        
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "coursesCell", for: indexPath) as! CoursesTableViewCell
        cell.myCourse_name.text = course_list[indexPath.row].course_name
        cell.myCourse_fee.text = course_list[indexPath.row].course_fee
        cell.myCourse_end.text = course_list[indexPath.row].course_end
        cell.myCourse_starting.text = course_list[indexPath.row].course_starting
        cell.myCourse_timing.text = course_list[indexPath.row].course_timing
        let url = URL(string: course_list[indexPath.row].featured_img!)
        cell.myCourse_image.kf.setImage(with: url)
        cell.myCourse_image.layer.cornerRadius = cell.myCourse_image.layer.frame.width/2
        cell.myCourse_image.clipsToBounds = true
        // Configure the cell...

        return cell
    }
    

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
