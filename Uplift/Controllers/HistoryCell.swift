//
//  HistoryCell.swift
//  Uplift
//
//  Created by Kevin Chen on 2/17/2019.
//  Copyright © 2019 Matthew Rodriguez. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    /**
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var date: UILabel!
 **/
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
