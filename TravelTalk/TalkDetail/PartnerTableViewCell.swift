//
//  PartnerTableViewCell.swift
//  TravelTalk
//
//  Created by cho on 1/14/24.
//

import UIKit

class PartnerTableViewCell: UITableViewCell {
    
    @IBOutlet var partnerImageView: UIImageView!
    @IBOutlet var partnerNameLabel: UILabel!
    @IBOutlet var chatView: UIView!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        partnerImageView.contentMode = .scaleAspectFit
        partnerImageView.layer.borderWidth = 0.5
        partnerImageView.layer.borderColor = UIColor.black.cgColor
        partnerNameLabel.font = .boldSystemFont(ofSize: 14)
        
        DispatchQueue.main.async {
            self.partnerImageView.layer.cornerRadius = self.partnerImageView.frame.height/2
        }
        
        chatView.backgroundColor = .white
        
        setChatUI(chatView: chatView, chatLabel: chatLabel, dateLabel: dateLabel)
    }    
}
