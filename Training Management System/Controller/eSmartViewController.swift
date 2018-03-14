//
//  eSmartViewController.swift
//  Training Management System
//
//  Created by Prajwal kc on 2/28/18.
//  Copyright © 2018 Prajwal kc. All rights reserved.
//

import UIKit

class eSmartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.title = "my Dashboard"
        self.navigationItem.title = "eSmart News"

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
