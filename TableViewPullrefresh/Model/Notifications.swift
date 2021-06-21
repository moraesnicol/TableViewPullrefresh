//
//  APIResponse.swift
//  TableViewPullrefresh
//
//  Created by Gabriel on 19/06/21.
//

import UIKit

struct Root: Codable {
    let notifications: [Notification]
    
}

struct Notification:  Codable {
    let id, content: String
    var isRead: Bool
}


