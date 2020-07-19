//
//  MyChatCell.swift
//  Flash Chat iOS13
//
//  Created by DAPL-Asset-290 on 26/06/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class MyChatCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var bubbleView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bubbleView.layer.cornerRadius = bubbleView.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
