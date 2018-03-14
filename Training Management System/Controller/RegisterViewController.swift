//
//  RegisterViewController.swift
//  Training Management System
//
//  Created by Prajwal kc on 3/5/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase




class RegisterViewController: UIViewController , UIPickerViewDelegate ,UIPickerViewDataSource {
    @IBAction func cancelBtnpressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var userRef :[users] = []
    @IBOutlet weak var myCourses: UILabel!
    var items : [String] = ["Java","Android","Ios","Javascript","Php"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return  items.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myCourses.text = items[row]
        
    }
    
    @IBOutlet weak var myPicker: UIPickerView!
    
    
    @IBAction func myRegisterBtnPress(_ sender: Any)  {
      
        if UserDefaults.standard.string(forKey: "userType") == "Student"  {
            
            let ref = Database.database().reference().child("registration").childByAutoId()
            if myCourses.text != "" && myContactNo.text != "" && myCollege.text != "" && myAddress.text != "" {
            let values = ["name" : myNameLabel.text! , "email" : myEmailLabel.text as Any , "address" : myAddress.text as Any , "college" : myCollege.text as Any,"contactNo" : myContactNo.text as Any , "course":myCourses.text as Any] as [String : Any]
            
            ref.updateChildValues(values)
            alertNotify(message: "Thank you for the Registrartion \n We will contact you as soon as possible", title: "Successfully Registered")
            }
            else{
                alertNotify(message: "No data Inserted \n Please insert data to proccess", title: "No Data")
            }
            
        }else {
            alertNotify(message: "You need to be a Student to Register  a course", title: " Error")
            
            
        }
      
    }
    @IBOutlet weak var myCollege: UITextField!
    @IBOutlet weak var myContactNo: UITextField!
   
    @IBOutlet weak var myAddress: UITextField!
    @IBOutlet weak var myEmailLabel: UILabel!
    @IBOutlet weak var myNameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gettingData()
    }
    
    override func viewDidLoad() {
    
        
        super.viewDidLoad()
        myCourses.text = "Select Your Courses"
        self.myPicker.delegate = self
        self.myPicker.dataSource = self
        
        
   
       
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let uid = Auth.auth().currentUser?.uid
    
    //Mark: - Creating a refrence to acces Information of User for Student type
    func gettingData() {
       
        Database.database().reference().child("Users").child("Student").child(uid!).observeSingleEvent(of: .value, with: {
    (snapshot) in
    
    //Mark: - Accessing the information "name" of User through Dictionary
    if let dictionary = snapshot.value as? [String:AnyObject]{
    self.myNameLabel.text = dictionary["name"]  as? String
    self.myEmailLabel.text = dictionary["email"] as? String
        print(dictionary)
        UserDefaults.standard.set(dictionary["userType"], forKey: "userType")
        
        }
    })
}
    func alertNotify(message:String , title:String){
        let alertAction = UIAlertAction.init(title: "ok", style: .default){
            (action) in
            self.dismiss(animated: true, completion: nil)
        }
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
