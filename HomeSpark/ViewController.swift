//
//  ViewController.swift/Users/developer/Desktop/PebbleSpark/PebbleSpark/ViewController.swift
//  PebbleSpark
//
//  Created by Developer on 12/1/14.
//  Copyright (c) 2014 tinytugboats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let deviceID = "<YourDeviceIDHere>"
    private let accessToken = "<YourAccessTokenHere>"

    @IBOutlet weak var switchStatusLabel: UILabel!
    @IBOutlet weak var switchObject: RAMPaperSwitch!

    @IBAction func switchPressedAction(sender: AnyObject) {
        spark()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        spark()
    }

    func spark() -> Void {
        // URLS
        let baseURL = NSURL(string: "https://api.spark.io")
        let devicesURL = NSURL(string: "/v1/devices/\(deviceID)/led", relativeToURL: baseURL)

        // POST Request
        var postRequest = NSMutableURLRequest(URL: devicesURL!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: 60.0)

        postRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        postRequest.HTTPMethod = "POST"

        if (switchObject.on) {
            switchStatusLabel.text = "On"
            switchStatusLabel.textColor = UIColor.blackColor()

            // Send command to Spark Core
            var command = "D7,HIGH"
            var bodyData = "access_token=\(accessToken)&params=\(command)"

            //        let data = (bodyData as NSString).dataUsingEncoding(NSUTF8StringEncoding)
            postRequest.HTTPBody = (bodyData as NSString).dataUsingEncoding(NSUTF8StringEncoding)
            //        [postRequest setHTTPBody: [NSData dataWithBytes: [bodyData UTF8String] length:strlen([bodyData UTF8String])]];


            NSURLConnection.sendAsynchronousRequest(postRequest, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                if ((error) != nil) {
                    println("Error: \(error)")
                } else if (error == nil) {
                    println("No errors.")
                }
            }


        } else if (!switchObject.on) {
            switchStatusLabel.text = "Off"
            switchStatusLabel.textColor = UIColor.whiteColor()

            // Send command to Spark Core
            var command = "D7,LOW"
            var bodyData = "access_token=\(accessToken)&params=\(command)"

            //        let data = (bodyData as NSString).dataUsingEncoding(NSUTF8StringEncoding)
            postRequest.HTTPBody = (bodyData as NSString).dataUsingEncoding(NSUTF8StringEncoding)
            //        [postRequest setHTTPBody: [NSData dataWithBytes: [bodyData UTF8String] length:strlen([bodyData UTF8String])]];


            NSURLConnection.sendAsynchronousRequest(postRequest, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
                if ((error) != nil) {
                    println("Error: \(error)")
                } else if (error == nil) {
                    println("No errors.")
                }
            }

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}