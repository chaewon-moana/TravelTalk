//
//  TalkViewController.swift
//  TravelTalk
//
//  Created by cho on 1/14/24.
//

import UIKit

class TalkViewController: UIViewController {

    let chatList = mockChatList
    var reloadList: [ChatRoom] = mockChatList
    var tmp: Set = Set<String>()
    
    @IBOutlet var userSearchBar: UISearchBar!
    @IBOutlet var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "TRAVEL TALK"
        mainTableView.separatorStyle = .none
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        userSearchBar.delegate = self
        
        setSearchBar()

        let xib = UINib(nibName: "TalkTableViewCell", bundle: nil)
        mainTableView.register(xib, forCellReuseIdentifier: "TalkTableViewCell")
        
    }

}

extension TalkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reloadList.count
        //return mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: "TalkTableViewCell", for: indexPath) as! TalkTableViewCell
        
        let data = reloadList[indexPath.row]
        //let data = mockChatList[indexPath.row]
        cell.configureCell(data: data)
        
        //mainTableView.reloadData()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)

        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TalkDetailViewController") as! TalkDetailViewController
        print(indexPath.row)
        
        let id = reloadList[indexPath.row].chatroomId - 1
        vc.chatRoomId = id //chatroomID를 ChatRoom의 index로 처리하게끔 해서 Detail에서 다 처리,,,
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension TalkViewController: UISearchBarDelegate {
    func setSearchBar() {
        userSearchBar.placeholder = "친구 이름을 검색해보세요"
        userSearchBar.searchBarStyle = .minimal
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        reloadList = []
        var check: Set<Int> = []
        
        for i in 0...mockChatList.count - 1 {
            let data = mockChatList[i].chatList
            for j in 0...data.count - 1 {
                if data[j].user.rawValue.contains(searchText) {
                    check.insert(i)
                }
            }
        }
        
        for i in check {
            reloadList.append(mockChatList[i])
        }
        
        if searchText == "" {
            reloadList = mockChatList
        }
        mainTableView.reloadData()
    }
}
