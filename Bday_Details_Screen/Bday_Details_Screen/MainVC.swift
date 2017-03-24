//
//  ViewController.swift
//  Bday_Details_Screen
//
//  Created by Appinventiv on 24/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker

class MainVC: UIViewController {

    
    @IBOutlet weak var Details_TableView: UITableView!

    let headerTitle = ["DESCRIPTION","LOCATION"]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        Details_TableView.rowHeight = UITableViewAutomaticDimension
        Details_TableView.estimatedRowHeight = 10
        
        Details_TableView.dataSource = self
        Details_TableView.delegate = self
               
    }
    
    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
    }

}

extension MainVC: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Details_Description_TableViewCellID", for: indexPath) as! Details_Description_TableViewCell
            
            cell.headerLabel.text = "\(headerTitle[indexPath.section])"
            
            cell.descriptionLabel.text = "Perfect for real estate agents, sales people, freelancers, taxi dispatchers, and other businesses that rely on texting to send quick, professional SMS messages to colleagues & Perfect for real estate agents sales people, freelancers, taxi dispatchers, and other businesses that rely on texting to send quick, professional SMS messages to colleagues"
        
            return cell

        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Details_Map_TableViewCellID", for: indexPath) as! Details_Map_TableViewCell
            
            cell.headerLabel.text = "\(headerTitle[indexPath.section])"
            
            return cell
        }
    }
    
}
