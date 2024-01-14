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
        
        DispatchQueue.main.async {
            self.mainImageView.layer.cornerRadius = self.mainImageView.frame.height/2
        }
        mainImageView.backgroundColor = .white
        mainImageView.contentMode = .scaleAspectFit
        mainImageView.clipsToBounds = true
        mainImageView.layer.borderWidth = 1
        mainImageView.layer.borderColor = UIColor.clear.cgColor
        
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 14)
        
        chatLabel.textColor = .gray
        chatLabel.font = .systemFont(ofSize: 12)
        
        dateLabel.textColor = .gray
        dateLabel.textAlignment = .right
        dateLabel.font = .systemFont(ofSize: 11)
        
        
    }
    
    func configureCell(data: ChatRoom) {
        let image = data.chatroomImage[0]
        mainImageView.image = UIImage(named: image)
        
        nameLabel.text = data.chatroomName
        
        chatLabel.text = data.chatList.last?.message
        dateLabel.text = setDate(date: data.chatList.last?.date ?? "", format: "yy.MM.dd")
    }

    func setDate(date: String, format: String) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let convert = dateFormatter.date(from: date)
        
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: convert!)
        
    }
    
}
