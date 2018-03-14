//
//  ViewController.swift
//  Training Management System
//
//  Created by Prajwal kc on 2/26/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UserNotifications
import SVProgressHUD
import FirebaseDatabase
import UIKit
import FirebaseAuth
import Firebase


class ViewController: UIViewController {
    
    
    //Mark: - All the outlets
    @IBOutlet weak var myDisplayName: UITextField!
    @IBOutlet weak var myEmailTextfield: UITextField!
    @IBOutlet weak var mySegment: UISegmentedControl!
    @IBOutlet weak var myPasswordTextfield: UITextField!
  
 
    //MARK :- Action When LogIn Button Pressed
    @IBAction func LogInPressed(_ sender: Any) {
        SVProgressHUD.show(withStatus: "Logging In")
        
        Auth.auth().signIn(withEmail: myEmailTextfield.text!, password: myPasswordTextfield.text!) { (user, error) in
            if user != nil
                //Sign in User
            {
              //let dashTVC = self.storyboard?.instantiateViewController(withIdentifier: "dashTVC") as! DashBoardTableViewController
                self.dismiss(animated: true, completion: nil)
            }
            else
               
                //Error While Signing In
               {
                if let myError = error?.localizedDescription
                {
                    self.alertNotify(message: myError, title: "Error While Processing")
                }else{
                    self.alertNotify(message: "Please Enter the valid Email address and Password", title: "Invalid Input")
                }
            }
            SVProgressHUD.dismiss()
                    }}
    
    //Mark :- Action while SignUp button Pressed
    @IBAction func SignUpPressed(_ sender: Any) {
        SVProgressHUD.show(withStatus: "Signing Up")
        
        //Mark: - Creating the User email and registering it to Authentication Database
        Auth.auth().createUser(withEmail: myEmailTextfield.text!, password: myPasswordTextfield.text!) { (user, error) in
              SVProgressHUD.dismiss()
            if user != nil {
                
                //Mark: - Refrencing to the Database
                 let ref : DatabaseReference = Database.database().reference(fromURL: "https://training-management-syst-a67c0.firebaseio.com/")
                
                
                //Mark: - Creating a Dictionary to push data into Database
                let values = ["name":self.myDisplayName.text!,"email":self.myEmailTextfield.text!,"userType":self.getSegmentName(segid: self.mySegment.selectedSegmentIndex)]
                
                
                //Mark:- Referened item pushed into the Database
                let userRef = ref.child("Users").child(self.getSegmentName(segid: self.mySegment.selectedSegmentIndex)).child(user!.uid)
                userRef.updateChildValues(values, withCompletionBlock: { (err, ref) in
              
                    if err != nil {
                
                        self.alertNotify(message: "Database inserting Error", title: "We are sorry for the inconvience. /n We will be solving this problem very soon")
                    }else{
                        self.alertNotify(message: "Congratulations! Successfully account created. \n Please log in", title: "Successfullyy Account Created")
                    }
                })
                return
                
            }
                //Mark: - When there is error is creating and registering User Email
            else
            {
                
                if let myError = error?.localizedDescription
                {
                    self.alertNotify(message: myError, title: "Error")
                }else{
                    self.alertNotify(message: "Please Enter the valid Email address and Password", title: "Invalid Input")
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    
    
    //Mark :- getting Segment Name for creating a separate Database for Student and Teacher
    func getSegmentName(segid:Int) -> String{
       
        var segName : String
        switch (segid){
        case 0:
            segName = "Student"
            break
        case 1:
            segName = "Teacher"
        case 2:
            segName = "Admin"
            
        default:
            segName = ""
        }
        return segName
    }
      // Mark : Performing alert
    func alertNotify(message:String , title:String){
        let alertAction = UIAlertAction.init(title: "ok", style: .default){
            (action) in
        }
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

