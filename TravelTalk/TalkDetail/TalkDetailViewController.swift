//
//  TalkDetailViewController.swift
//  TravelTalk
//
//  Created by cho on 1/14/24.
//

import UIKit

class TalkDetailViewController: UIViewController {

    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var chatTextField: UITextField!
    @IBOutlet var sendButton: UIImageView!
    
    var chatRoomId: Int = 0
    lazy var data = mockChatList[chatRoomId]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.rowHeight = UITableView.automaticDimension
        navigationItem.title = mockChatList[chatRoomId].chatroomName
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.separatorStyle = .none

        chatTextField.delegate = self
        chatTextField.autocorrectionType = .no
        chatTextField.autocapitalizationType = .none
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        sendButton.image = UIImage(systemName: "paperplane")
        sendButton.tintColor = .gray
        chatTextField.placeholder = "메시지를 입력해주세요"
        
        let userXIB = UINib(nibName: "UserTableViewCell", bundle: nil)
        mainTableView.register(userXIB, forCellReuseIdentifier: "UserTableViewCell")
        
        let partnerXIB = UINib(nibName: "PartnerTableViewCell", bundle: nil)
        mainTableView.register(partnerXIB, forCellReuseIdentifier: "PartnerTableViewCell")
        
        scrollToBottom()
        
        
    }

}

extension TalkDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.chatList.count
    }
    
    func scrollToBottom() {
        let lastIndexPath = IndexPath(row: data.chatList.count-1, section: 0)
        mainTableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: false)
    }
    
    func setDate(date: String, format: String) -> String {

        let beforeDate = DateFormatter()
        beforeDate.dateFormat = "yyyy-MM-dd HH:mm"
        
        let convert = beforeDate.date(from: date)
        
        let convertDate = DateFormatter()
        convertDate.locale = Locale(identifier: "ko_KR")
        convertDate.dateFormat = format
      
        return convertDate.string(from: convert!)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let userCell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        
        let partnerCell = tableView.dequeueReusableCell(withIdentifier: "PartnerTableViewCell") as! PartnerTableViewCell
        
        userCell.chatLabel.text = data.chatList[indexPath.row].message
        
        userCell.dateLabel.text = setDate(date: data.chatList[indexPath.row].date, format: "a HH:mm")
        
        partnerCell.chatLabel.text = data.chatList[indexPath.row].message
        partnerCell.dateLabel.text = setDate(date: data.chatList[indexPath.row].date, format: "a HH:mm")
        partnerCell.partnerNameLabel.text = data.chatList[indexPath.row].user.rawValue
        let image = UIImage(named: data.chatList[indexPath.row].user.profileImage)
        partnerCell.partnerImageView.image = image
        
        if data.chatList[indexPath.row].user == .user {
            return userCell
        } else {
            return partnerCell
        }
    }
}

extension TalkDetailViewController: UITextFieldDelegate {
    @objc func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -330
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
}
