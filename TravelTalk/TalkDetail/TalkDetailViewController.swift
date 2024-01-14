//
//  TalkDetailViewController.swift
//  TravelTalk
//
//  Created by cho on 1/14/24.
//

import UIKit

class TalkDetailViewController: UIViewController {

    var partnerName: String = ""
    var chatRoomId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = partnerName
                
    }
    

}

extension TalkDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        let partnerCell = tableView.dequeueReusableCell(withIdentifier: "PartnerTableViewCell", for: indexPath) as! PartnerTableViewCell
        
        
        
        
        return userCell
    }
    
    
    
    
}
