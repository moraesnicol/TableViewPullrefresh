//
//  ViewController.swift
//  TableViewPullrefresh
//
//  Created by Gabriel on 19/06/21.
//

import UIKit

class ViewController: UIViewController {
    
   var tableData = [String]()
    
    let table: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        view.addSubview(table)
        fetchData()
        
    }
    
    //
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
        
        
    }
    //
    
        func fetchData() {
        guard let url = URL(string:
                "https://api.jsonbin.io/b/607db4d70ed6f819beb03020") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, _, error in
            guard let strongSelf = self, let data = data, error == nil else {
                return
            }
            
            var result: APIResponse?
            do {
                result = try JSONDecoder().decode(APIResponse.self, from: data)
            }
            catch {
                //handle error
            }
            guard let final = result else {
                return
            }
            
            strongSelf.tableData.append("ID:  \(final.results.id)")
            strongSelf.tableData.append("Status:  \(final.results.content)")
            
            DispatchQueue.main.async {
                strongSelf.table.reloadData()
            }
           
            
        })
        
        task.resume()
        }
        
    

}







extension ViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
