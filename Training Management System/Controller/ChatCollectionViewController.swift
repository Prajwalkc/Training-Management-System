//
//  ChatCollectionViewController.swift
//  Training Management System
//
//  Created by Prajwal kc on 3/1/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase


private let reuseIdentifier = "Cell"

class ChatCollectionViewController: UICollectionViewController ,UITextFieldDelegate{
    var index = 0
    var user :[users] = []
    var Teachers : [Teacher] = []
    var Students :[Student] = []
    @IBOutlet weak var myMessageTextfield: UITextField!
    func sendMessage(){
        
        let ref = Database.database().reference().child("message").childByAutoId()
        
        let values = ["text" : myMessageTextfield.text! , "toMail" : user[index].email , "fromID" : Auth.auth().currentUser?.uid]
        
           ref.updateChildValues(values)
        myMessageTextfield.text = " "
        
        }
    @IBAction func myMessageSendButton(_ sender: Any) {
         sendMessage()
     
    
    }
    
    
    @IBOutlet weak var myMessageView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myMessageTextfield.delegate = self
        
        self.navigationItem.title = user[index].name!

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendMessage()
        return true
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
