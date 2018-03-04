//
//  ChatCell.swift
//  ParseChat
//
//  Created by Kishor Subedi on 3/3/18.
//  Copyright © 2018 Kishor Subedi. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var usernameField: UILabel!
    @IBOutlet weak var historymessageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
