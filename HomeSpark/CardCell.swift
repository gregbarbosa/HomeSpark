//
//  CardCell.swift
//  HomeSpark
//
//  Created by Greg Barbosa on 12/3/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    
    private let deviceID = "48ff6e065067555038561287"
    private let accessToken = "a059d7597a38ecccdfe6df3d440440a3b6ba764a"
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var paperSwitch: RAMPaperSwitch!
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBAction func paperSwitch(sender: RAMPaperSwitch) {
        spark()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        cardSetup()
    }
    
    func cardSetup() -> Void {
        cardView.alpha = 1.0
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 2
        cardView.layer.shadowOffset = CGSizeMake(-0.2, 2)
        cardView.layer.shadowRadius = 1
        var path = UIBezierPath(rect: cardView.bounds)
        cardView.layer.shadowPath = path.CGPath
        cardView.layer.shadowOpacity = 0.12
        
    }
    
    func spark() -> Void {
        // URLS
        let baseURL = NSURL(string: "https://api.spark.io")
        let devicesURL = NSURL(string: "/v1/devices/\(deviceID)/led", relativeToURL: baseURL)
        
        // POST Request
        var postRequest = NSMutableURLRequest(URL: devicesURL!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: 60.0)
        
        postRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        postRequest.HTTPMethod = "POST"
        
        if (paperSwitch.on) {
            // Send command
            var command = "D7,HIGH"
            var bodyData = "access_token=\(accessToken)&params=\(command)"
            
            postRequest.HTTPBody = (bodyData as NSString).dataUsingEncoding(NSUTF8StringEncoding)
            NSURLConnection.sendAsynchronousRequest(postRequest, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                if ((error) != nil) {
                    println("Error: \(error)")
                } else if (error == nil) {
                    println("No errors.")
                }
            }
            
        } else if (!paperSwitch.on) {
            // Send command
            var command = "D7,LOW"
            var bodyData = "access_token=\(accessToken)&params=\(command)"
            
            postRequest.HTTPBody = (bodyData as NSString).dataUsingEncoding(NSUTF8StringEncoding)
            NSURLConnection.sendAsynchronousRequest(postRequest, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                if ((error) != nil) {
                    println("Error: \(error)")
                } else if (error == nil) {
                    println("No errors.")
                }
            }
            
        }
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        cardView.layer.shadowOffset = CGSizeMake(-0.2, 3)
        cardView.layer.shadowOpacity = 0.12
        super.touchesBegan(touches, withEvent: event)
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        cardView.layer.shadowOffset = CGSizeMake(-0.2, 2)
        cardView.layer.shadowOpacity = 0.12
        super.touchesEnded(touches, withEvent: event)
        
    }
    
}