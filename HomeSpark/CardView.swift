//
//  CardView.swift
//  HomeSpark
//
//  Created by Greg Barbosa on 12/3/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit

class CardView: UITableViewController {
    
    let items = ["Lamp", "Desk Lamp", "Bed", "Television", "Office Computer"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return items.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cardCell", forIndexPath: indexPath) as CardCell
        cell.layer.masksToBounds = true
        cell.itemImage?.image = UIImage(named: "\(items[indexPath.row])")
        
        return cell
        
    }
    
}
