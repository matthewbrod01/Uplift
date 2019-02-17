//
//  LiveFeedViewController.swift
//  Uplift
//
//  Created by Matthew Rodriguez on 2/16/19.
//  Copyright © 2019 Matthew Rodriguez. All rights reserved.
//

import UIKit
import Firebase
import AVKit

class LiveFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var avPlayer: AVPlayer? = nil
    var posts: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 490
        
        let dbRef = Database.database().reference(fromURL: "https://uplift-8ef8c.firebaseio.com/").child("a")
        dbRef.observe(.value) { (snapshot) in
            for child in snapshot.children{
                let snap = child as! DataSnapshot
                let value = snap.value as! String
                self.posts.append(value)
            }
        }
        tableView.reloadData()
    }
    
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        
        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        //let urlString = posts[indexPath.row]
        //let url = URL(string: urlString)
        let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/uplift-8ef8c.appspot.com/o/8AA0A3A8-DF76-45E6-82BA-71A95705E8E7.mov?alt=media&token=39059fbe-790d-4310-94e5-f6c25c21c429")
        if let thumbnailImage = getThumbnailImage(forUrl: url!) {
            cell.mediaView.image = thumbnailImage
            let radians: CGFloat = 90 * (.pi/180)
            cell.mediaView.transform = CGAffineTransform(rotationAngle: radians)
        }
        return cell
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
