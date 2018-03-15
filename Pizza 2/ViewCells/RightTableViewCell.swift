//
//  RightTableViewCell.swift
//  Pizza 2
//
//  Created by Saleh Majıdov on 3/15/18.
//  Copyright © 2018 Saleh Majıdov. All rights reserved.
//

import UIKit

class RightTableViewCell: UITableViewCell {
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var userMessageBody: UILabel!
    @IBOutlet weak var userTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
