//
//  DashBoardTableViewController.swift
//  Training Management System
//
//  Created by Prajwal kc on 2/27/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class DashBoardTableViewController: UITableViewController {
    
    var list : [String] = ["Add My Information","See all Courses","eSmart News","Register a Course"]
    override func viewDidLoad() {
       
        super.viewDidLoad()
           checkIfUserIsLoggedIn()
        self.navigationItem.title = "Welcome"
    navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Log Out", style: .plain, target: self, action: #selector(handlelogout))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.green
        navigationItem.leftBarButtonItem?.tintColor = UIColor.red
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Messages", style: .plain, target: self, action: #selector(handleMessages))
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //Mark: - Handling Message BarButton
   @objc func handleMessages(){
       let messageTVC = self.storyboard?.instantiateViewController(withIdentifier: "messageTVC") as! MesssagesTableViewController
    self.navigationController?.pushViewController(messageTVC, animated: true)
    //Creating a Navigation bar for MessageTableViewController
    // let navController = UINavigationController.init(rootViewController: messageTVC)
  //Navigating the NavController instead the MessageViewController
    //self.navigationController?.present(navController, animated: true, completion: nil)
    }
    
    //Mark: -Checking the user log
    func checkIfUserIsLoggedIn(){
        
        
        //Mark: -When there is no user Logged In
        if Auth.auth().currentUser == nil {
            perform(#selector(handlelogout), with: nil, afterDelay: 0)
        }
            
            //Mark: - When there is logged In User
        else{
            
            //Mark:- Accessing the User ID
            let uid = Auth.auth().currentUser?.uid
            
            //Mark: - Creating a refrence to acces Information of User for Student type
            
            Database.database().reference().child("Users").child("Student").child(uid!).observeSingleEvent(of: .value, with: {
             (snapshot) in
                
                //Mark: - Accessing the information "name" of User through Dictionary
                if let dictionary = snapshot.value as? [String:AnyObject]{
                    self.navigationItem.title = dictionary["name"]  as? String
                 
                }
            })
            
            //Mark: - Creating a refrence to acces Information of User for Student type
            Database.database().reference().child("Users").child("Teacher").child(uid!).observeSingleEvent(of: .value, with: {
                (snapshot) in
                
             //Mark: - Accessing the information "name" of User through Dictionary
                if let dictionary = snapshot.value as? [String:AnyObject]{
                    self.navigationItem.title = dictionary["name"] as? String
                }
                
            })
            }
    }
    
    //Mark: - Handling the log out function called in while checking user log in status
    @objc func handlelogout(){
        do{
            try Auth.auth().signOut()
        }catch let signoutError {
           self.alertNotify(message: signoutError.localizedDescription, title: "Error While Processing")
        }
        let LoginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! ViewController
        self.navigationController?.present(LoginVC, animated: true, completion: nil)
        
}
   
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func alertNotify(message:String , title:String){
        let alertAction = UIAlertAction.init(title: "ok", style: .default){
            (action) in
        }
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dashboardCell", for: indexPath) as! DashBoardTableViewCell

   cell.myDashCell.text = list[indexPath.row]

        return cell
    }
    

    @available(iOS 2.0, *)
   public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        switch (indexPath.row) {
        case 0:
           
            break
        case 1:
            let coursesTVC = self.storyboard?.instantiateViewController(withIdentifier: "coursesTVC") as! CoursesTableViewController
            self.navigationController?.pushViewController(coursesTVC, animated: true)
            break
        case 2 :
               let eSmartTVC =  self.storyboard?.instantiateViewController(withIdentifier: "eSmartTVC") as! eSmartTableViewController
                self.navigationController?.pushViewController(eSmartTVC, animated: true)
            break
        case 3 :
            let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "registerVC") as! RegisterViewController
            
            self.navigationController?.present(registerVC, animated: true, completion: nil)
            break
        default:
            break
        }
        
    }

}
