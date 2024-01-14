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
        DispatchQueue.main.async {
            self.partnerImageView.layer.cornerRadius = self.partnerImageView.frame.height/2
        }
        
        chatView.backgroundColor = .white
        chatView.clipsToBounds = true
        chatView.layer.cornerRadius = 8
        chatView.layer.borderColor = UIColor.black.cgColor
        chatView.layer.borderWidth = 1
        
        
        
        partnerNameLabel.font = .boldSystemFont(ofSize: 14)
        
        chatLabel.sizeToFit()
        chatLabel.font = .systemFont(ofSize: 14)
        chatLabel.numberOfLines = 0
        
        dateLabel.font = .systemFont(ofSize: 10)
    }


    
}
