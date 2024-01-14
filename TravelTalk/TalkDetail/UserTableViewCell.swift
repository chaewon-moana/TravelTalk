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
        
        chatLabel.sizeToFit()
        chatLabel.font = .systemFont(ofSize: 14)
        chatLabel.numberOfLines = 0
        
        dateLabel.font = .systemFont(ofSize: 10)
        
        chatView.backgroundColor = .lightGray
        chatView.clipsToBounds = true
        chatView.layer.cornerRadius = 8
        chatView.layer.borderColor = UIColor.black.cgColor
        chatView.layer.borderWidth = 1
    }

  
    
}
