//
//  ChatUI+Extension.swift
//  TravelTalk
//
//  Created by cho on 1/14/24.
//

import UIKit

extension UITableViewCell {
    func setChatUI(chatView: UIView, chatLabel: UILabel, dateLabel: UILabel) {
        chatLabel.sizeToFit()
        chatLabel.font = .systemFont(ofSize: 14)
        chatLabel.numberOfLines = 0
        
        dateLabel.font = .systemFont(ofSize: 10)
        
        chatView.clipsToBounds = true
        chatView.layer.cornerRadius = 8
        chatView.layer.borderColor = UIColor.black.cgColor
        chatView.layer.borderWidth = 1
        
        selectionStyle = .none
    }
}
