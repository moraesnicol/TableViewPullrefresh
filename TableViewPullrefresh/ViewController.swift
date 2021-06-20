//
//  ViewController.swift
//  TableViewPullrefresh
//
//  Created by Gabriel on 19/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let table: UITableView = {
       let table = UITableView()
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        view.addSubview(table)
        
    }
    
    //
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
        
        
    }
    //
    
    private func fetchData() {
        guard let url = URL(string:
                "https://api.jsonbin.io/b/607db4d70ed6f819beb03020"
        ) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data, error == nil else {
                return
            }
        })
        
        task.resume()
        }
        
    

}







extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
