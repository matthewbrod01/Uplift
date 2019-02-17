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
            for child in snapshot.children.reversed() {
                let snap = child as! DataSnapshot
                let value = snap.value as! String
                self.posts.append(value)
            }
            self.tableView.reloadData()
        }
        tableView.reloadData()

    }
    
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        
        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 30) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        let urlString = posts[indexPath.row]
        let url = URL(string: urlString)
        if let thumbnailImage = getThumbnailImage(forUrl: url!) {
            cell.mediaView.image = thumbnailImage
            let radians: CGFloat = 90 * (.pi/180)
            cell.mediaView.transform = CGAffineTransform(rotationAngle: radians)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = posts[indexPath.row]
        let videoUrl = URL(string: video)
        let player = AVPlayer(url: videoUrl!)
        
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        present(playerViewController, animated: true) {
            player.play()
        }
    }
}
