//
//  ExploreCell.swift
//  Uplift
//
//  Created by Joseph Shimonov on 2/17/19.
//  Copyright © 2019 Matthew Rodriguez. All rights reserved.
//

import UIKit

class ExploreCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
