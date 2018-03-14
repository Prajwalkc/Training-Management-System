//
//  MesssagesTableViewController.swift
//  Training Management System
//
//  Created by Prajwal kc on 2/27/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class MesssagesTableViewController: UITableViewController {
    
    var messages :[Message] = []
    var students :[Student] = []
    var Users :[users] = []
    var teachers :[Student] = []
    @IBOutlet var myTabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Messages"
        self.myTabelView.estimatedRowHeight = 44.0
        self.myTabelView.rowHeight = UITableViewAutomaticDimension
        //Mark: - Creating a leftBarButton in NavigationBar
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        //Mark: - Fetching Data for Students
        fetchUser(userType: "Student")
        
        //Mark :- Fetching Data for Teachers
        fetchUser(userType: "Teacher")
       
     //  fetchMessage()
       // print(messages[0].text!)
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    //Mark: - Defining the method for creating a leftBarButton in NavigationBar
     @objc func handleCancel(){
        
        //Mark: -  Returning to DashBoardTableViewController
        let dashTVC = self.storyboard?.instantiateViewController(withIdentifier: "dashTVC") as! DashBoardTableViewController
        self.navigationController?.pushViewController(dashTVC, animated: true)
    }
    
    func fetchUser(userType : String)  {
    
        Database.database().reference().child("Users").child(userType).observe(.childAdded, with: { (snapshot) in
     let dict = snapshot.value as! NSDictionary
      
            if userType == "Student"{
               
                self.students.append(Student.init(json: dict))
                
            }else if userType == "Teacher"{
               
                
                self.teachers.append(Student.init(json: dict))
            
            }
            self.Users.append(users.init(json: dict))
            
      
            self.myTabelView.reloadData()
    })
    
    }
    func fetchMessage(){
        Database.database().reference().child("message").observe(.childAdded, with: { (snapshot) in
            let dict = snapshot.value as! NSDictionary
            self.messages.append(Message.init(json: dict))
           
            
            DispatchQueue.global(qos: .background).async {
                self.myTabelView.reloadData()
                
                DispatchQueue.main.async {
                  
                }
            }
            })
    
       
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       return Users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
       cell.myCellLabel.text = Users[indexPath.row].name
        cell.myUserTypeLabel.layer.cornerRadius = 12
        cell.myUserTypeLabel.clipsToBounds = true
        cell.myUserTypeLabel.text = Users[indexPath.row].userType
        cell.myEmailLabel.text = Users[indexPath.row].email
        // cell.detailTextLabel?.text = messages[indexPath.row].text
      // cell.myEmailLabel.text = messages[indexPath.row].text
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
    var ChatController = ChatCollectionViewController()
    @available(iOS 2.0, *)
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
       let ChatVC = self.storyboard?.instantiateViewController(withIdentifier: "ChatCVC") as! ChatCollectionViewController
        self.navigationController?.pushViewController(ChatVC, animated: true)
                ChatVC.index = indexPath.row
        ChatVC.user  = Users
  
        }
    
    
        
    
}

