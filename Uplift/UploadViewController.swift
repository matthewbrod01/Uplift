//
//  UploadViewController.swift
//  Uplift
//
//  Created by Matthew Rodriguez on 2/16/19.
//  Copyright © 2019 Matthew Rodriguez. All rights reserved.
//

import UIKit
import Firebase

class UploadViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference(fromURL: "https://uplift-8ef8c.firebaseio.com/").child("a")
        ref.updateChildValues(["someKey": 25]) { (error, ref) in
            print("Hello World")
        }
        print("Hello")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
