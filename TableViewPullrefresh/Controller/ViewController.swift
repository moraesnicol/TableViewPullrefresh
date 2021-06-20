//
//  ViewController.swift
//  TableViewPullrefresh
//
//  Created by Gabriel on 19/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    let parser = Parser()
    var notifications = [Notification]()
    let sections = ["Não lidas", "Lidas"]
    
    
    
    let table: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchData()
        refreshControl()
       
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    
    
    
    
    
    func fetchData() {
        parser.parse {
            data in
            self.notifications = data
            DispatchQueue.main.async {
                self.table.reloadData()
        }
     }
    }
    
    func refreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        refreshControl.tintColor = .purple
        self.table.refreshControl = refreshControl
    }
    
    @objc func refresh(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.table.refreshControl?.endRefreshing()
        }
    }
 
    func configureTableView(){
        view.addSubview(table)
        setTableViewDelegate()
        table.rowHeight = 100
        table.separatorColor = .purple
        
        
    }
    
    func setTableViewDelegate() {
        table.delegate = self
        table.dataSource = self
    }
    
    
    

}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
   
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text =
            "ID: " + notifications[indexPath.row].id.appending(" Status: \(notifications[indexPath.row].content)")
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
    
    
}


