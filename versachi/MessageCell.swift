//
//  MessageCell.swift
//  versachi
//
//  Created by Mateo Garcia on 4/25/15.
//  Copyright (c) 2015 Theta Delta Chi, Eta Deuteron Charge. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
