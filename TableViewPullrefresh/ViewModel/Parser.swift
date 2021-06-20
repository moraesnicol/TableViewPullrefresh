//
//  Parser.swift
//  TableViewPullrefresh
//
//  Created by Gabriel on 20/06/21.
//

import Foundation

struct Parser {
    
    func parse(comp : @escaping ([Notification]) -> ()) {
        let api = URL(string: "https://api.jsonbin.io/b/607db4d70ed6f819beb03020")
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do {
           let result = try   JSONDecoder().decode(Root.self, from: data!)
                comp(result.notifications)
                print(result)
            } catch {
                
            }
        }.resume()
}
}
