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
        
        credentialsCheck()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func credentialsCheck() {
        // Confirms a user has inputted their access token and device ID.
        var userSettings: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var deviceID = userSettings.objectForKey("device_ID") as String
        var accessToken = userSettings.objectForKey("access_Token") as String
        var missingItem = String()
        
        if (accessToken.isEmpty && deviceID.isEmpty) {
            println("Both your Access Token and Device ID is missing.")
            missingItem = "access token and device ID"
            
        } else if (accessToken.isEmpty) {
            println("You are Access Token is missing.")
            missingItem = "access token"
            
        } else if (deviceID.isEmpty) {
            println("Your Device ID is missing.")
            missingItem = "device ID"
            
        } else {
            println("All credentials are present!")
            
        }
        
        // Credentials alert controller
        let credentialsCheckError = UIAlertController(title: "Missing \(missingItem)", message: "\nHomeSpark needs your Spark Core's \(missingItem) to send and receive commands. You can input this in the app's settings.", preferredStyle: .Alert)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        credentialsCheckError.addAction(cancelButton)
        
        let okButton = UIAlertAction(title: "Settings", style: .Default) { action in
            if let url = NSURL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.sharedApplication().openURL(url)
            }
        }
        credentialsCheckError.addAction(okButton)
        
        if (!missingItem.isEmpty) {
            self.presentViewController(credentialsCheckError, animated: true, completion: nil)
        }
    }
    
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
