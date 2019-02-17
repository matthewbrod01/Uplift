//
//  ExploreViewController.swift
//  Uplift
//
//  Created by Matthew Rodriguez on 2/16/19.
//  Copyright © 2019 Matthew Rodriguez. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    let data = ["James", "Mary", "John", "Patricia", "Robert", "Jennifer"]
    let des = ["For the past few years, I found out that there was so much that I am able to do. Now I feel like I barely have time for much, but I am here to let you know that you should not waste your time and use it wisely", "For the past few years, I found out that there was so much that I am able to do. Now I feel like I barely have time for much, but I am here to let you know that you should not waste your time and use it wisely","For the past few years, I found out that there was so much that I am able to do. Now I feel like I barely have time for much, but I am here to let you know that you should not waste your time and use it wisely","For the past few years, I found out that there was so much that I am able to do. Now I feel like I barely have time for much, but I am here to let you know that you should not waste your time and use it wisely","For the past few years, I found out that there was so much that I am able to do. Now I feel like I barely have time for much, but I am here to let you know that you should not waste your time and use it wisely","For the past few years, I found out that there was so much that I am able to do. Now I feel like I barely have time for much, but I am here to let you know that you should not waste your time and use it wisely"]
    let pics = ["James", "Mary", "John", "Patricia", "Robert", "Jennifer"]
    
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        filteredData = data
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreCell", for: indexPath) as! ExploreCell

        cell.nameLabel.text = data[indexPath.row]
        cell.descriptionLabel.text = des[indexPath.row]
        cell.pictureView.image = UIImage(named: pics[indexPath.row])
        return cell
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? data : data.filter { (item: String) -> Bool in
                return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            
        }
        tableView.reloadData()
        
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

