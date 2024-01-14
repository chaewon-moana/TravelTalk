//
//  TalkViewController.swift
//  TravelTalk
//
//  Created by cho on 1/14/24.
//

import UIKit

class TalkViewController: UIViewController {

    let chatList = mockChatList
    
    @IBOutlet var userSearchBar: UISearchBar!
    @IBOutlet var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "TRAVEL TALK"
        //navigationController?.navigationBar.shadowImage = UIImage()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        userSearchBar.placeholder = "친구 이름을 검색해보세요"
        
        userSearchBar.searchBarStyle = .minimal
        
        mainTableView.separatorStyle = .none

        
        let xib = UINib(nibName: "TalkTableViewCell", bundle: nil)
        mainTableView.register(xib, forCellReuseIdentifier: "TalkTableViewCell")
        
        
       // mainTableView.backgroundColor = .blue
    }

}

extension TalkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockChatList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TalkTableViewCell", for: indexPath) as! TalkTableViewCell
        
        let data = mockChatList[indexPath.row]
        
        
        let image = data.chatroomImage[0]
        DispatchQueue.main.async {
            cell.mainImageView.layer.cornerRadius = cell.mainImageView.frame.height/2
        }

        cell.mainImageView.image = UIImage(named: image)
        cell.mainImageView.backgroundColor = .white
        cell.mainImageView.contentMode = .scaleAspectFit
        cell.mainImageView.clipsToBounds = true
        cell.mainImageView.layer.borderWidth = 1
        cell.mainImageView.layer.borderColor = UIColor.clear.cgColor
        
        cell.nameLabel.text = data.chatroomName
        cell.nameLabel.textColor = .black
        cell.nameLabel.font = .systemFont(ofSize: 14)
        
        cell.chatLabel.text = data.chatList.last?.message
        cell.chatLabel.textColor = .gray
        cell.chatLabel.font = .systemFont(ofSize: 12)
        
        cell.dateLabel.text = data.chatList.last?.date
        cell.dateLabel.textColor = .gray
        cell.dateLabel.textAlignment = .right
        cell.dateLabel.font = .systemFont(ofSize: 11)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)

        let data = mockChatList[indexPath.row]

        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TalkDetailViewController") as! TalkDetailViewController
        
        vc.partnerName = data.chatroomName
        vc.chatRoomId = indexPath.row //indexPath를 ChatRoom의 index로 처리하게끔 해서
//
//        let nav = UINavigationController(rootViewController: vc)
//        
//        nav.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}
