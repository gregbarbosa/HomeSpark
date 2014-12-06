//
//  CardCell.swift
//  HomeSpark
//
//  Created by Greg Barbosa on 12/3/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    
    private let deviceID = "<YourDeviceID>"
    private let accessToken = "<YourAccessToken>"
    
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
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 2.0
        cardView.layer.shadowColor = UIColor(white: 0.0, alpha: 0.35).CGColor!
        cardView.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        cardView.layer.shadowRadius = 1.5
        var path = UIBezierPath(rect: cardView.bounds)
        cardView.layer.shadowPath = path.CGPath
        cardView.layer.shadowOpacity = 0.75
        
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
            itemImage.tintColor = UIColor.whiteColor()
            
            // Send command
            var command = "D7,HIGH"
            var bodyData = "access_token=\(accessToken)&params=\(command)"
            
            postRequest.HTTPBody = (bodyData as NSString).dataUsingEncoding(NSUTF8StringEncoding)
            NSURLConnection.sendAsynchronousRequest(postRequest, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                if ((error) != nil) {
                    println("Error: \(error)")
                    
                } else if (error == nil) {
                    // Print nothing
                    
                }
                
            }
            
        } else if (!paperSwitch.on) {
            itemImage.tintColor = UIColor.grayColor()
            
            // Send command
            var command = "D7,LOW"
            var bodyData = "access_token=\(accessToken)&params=\(command)"
            
            postRequest.HTTPBody = (bodyData as NSString).dataUsingEncoding(NSUTF8StringEncoding)
            NSURLConnection.sendAsynchronousRequest(postRequest, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                if ((error) != nil) {
                    println("Error: \(error)")
                    
                } else if (error == nil) {
                    // Print nothing
                    
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
        cardView.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        cardView.layer.shadowOpacity = 1.0
        super.touchesEnded(touches, withEvent: event)
        
    }
    
}