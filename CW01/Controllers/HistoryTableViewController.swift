//
//  HistoryTableViewController.swift
//  CW01
//
//  Created by Aravinthan Sathasivam on 3/16/21.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    
    var history : [String]  = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initHistoryInfor()
    }
    
    func initHistoryInfor(){
        loadDefaultData("TemperatureHistory")
        
        history.forEach { (data) in
            print(data)
            
        }
    }
    
    func loadDefaultData(_ historyKey: String) {
        let defaults = UserDefaults.standard
        
        history = defaults.object(forKey: historyKey) as? [String] ?? [String]()
    }

    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseHistoryCell")!
        cell.textLabel?.textAlignment = .center
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = history[indexPath.row]
        return cell
    }



}
