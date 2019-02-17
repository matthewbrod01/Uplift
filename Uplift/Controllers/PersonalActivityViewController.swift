//
//  PersonalActivityViewController.swift
//  Uplift
//
//  Created by Matthew Rodriguez on 2/16/19.
//  Copyright © 2019 Matthew Rodriguez. All rights reserved.
//

import UIKit

class PersonalActivityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // NEED these for table view to work
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50 // number of personal posts
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = tableView .dequeueReusableCell(withIdentifier: "HistoryCell") as! HistoryCell
        let cell = UITableViewCell()
        //let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = "row: \(indexPath.row)"
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        print("Hello")
    }

}
