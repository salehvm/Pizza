//
//  LeftTableViewCell.swift
//  Pizza 2
//
//  Created by Saleh Majıdov on 3/15/18.
//  Copyright © 2018 Saleh Majıdov. All rights reserved.
//

import UIKit

class LeftTableViewCell: UITableViewCell {

    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var adminTitle: UILabel!
    @IBOutlet weak var adminMessageBody: UILabel!
    @IBOutlet weak var adminTime: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
