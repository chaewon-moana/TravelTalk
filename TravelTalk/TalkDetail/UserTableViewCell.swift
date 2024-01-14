//
//  UserTableViewCell.swift
//  TravelTalk
//
//  Created by cho on 1/14/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet var chatView: UIView!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setChatUI(chatView: chatView, chatLabel: chatLabel, dateLabel: dateLabel)
        chatView.backgroundColor = .systemGray5

    }

  
    
}
