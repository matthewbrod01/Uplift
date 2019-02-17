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
    let comm = ["\"One of the most inspiring stories of my generation. Truly a gift from god\"",
                "\"It Doesn’t Matter Where You Came From. All That Matters Is Where You Are Going\"",
                "\"A Clear Vision, Backed By Definite Plans, Gives You A Tremendous Feeling Of Confidence And Personal Power\"",
                "\"Success Does Not Consist In Never Making Mistakes, But In Never Making The Same One A Second Time\"",
                "\"Think Big And Don’t Listen To People Who Tell You It Can’t Be Done. Life’s Too Short To Think Small\"",
                "\"Success Is Getting What You Want, Happiness Is Wanting What You Get\""]
    let date = ["-February 12", "-February 13","-February 14","-February 15","-February 16","-February 17"]
    
    // NEED these for table view to work
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comm.count // number of personal posts
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView .dequeueReusableCell(withIdentifier: "HistoryCell") as! HistoryCell
        //let cell = UITableViewCell()
        //let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as UITableViewCell
        cell.name.text = comm[indexPath.row]
        cell.date.text = date[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        //print("Hello")
    }

}
