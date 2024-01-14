//
//  TalkTableViewCell.swift
//  TravelTalk
//
//  Created by cho on 1/14/24.
//

import UIKit

class TalkTableViewCell: UITableViewCell {

    
    @IBOutlet var mainImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainImageView.image = UIImage(systemName: "star")
        
        nameLabel.text = "이름이름"
        chatLabel.text = "채팅내용입니다."
        
        dateLabel.text = "20240101"
        dateLabel.textAlignment = .right
        
    }

    
}
