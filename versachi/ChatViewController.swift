//
//  ChatViewController.swift
//  versachi
//
//  Created by Mateo Garcia on 4/25/15.
//  Copyright (c) 2015 Theta Delta Chi, Eta Deuteron Charge. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    var messages = [PFObject]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onTimer", userInfo: nil, repeats: true)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("MessageCell") as! MessageCell
        var obj = messages[indexPath.row]
        println(obj["text"])
        
        cell.messageLabel.text = obj["text"] as? String
        if let username = obj["user"] as? String {
            cell.usernameLabel.text = username
        } else {
            cell.usernameLabel.text = "[no username]"
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func onTimer() {
        // Add code to be run periodically
        var query = PFQuery(className:"Message")
        query.orderByDescending("createdAt")
        // query.includeKey("user")
        //query.whereKey("playerName", equalTo:"Sean Plott")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                // The find succeeded.
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    self.messages = objects
                    self.tableView.reloadData()
                    //for object in objects {
                    //   println(object["text"])
                    // }
                }
            } else {
                // Log details of the failure
                println("Error: \(error) \(error!.userInfo!)")
            }
        }
        
    }
    
    @IBAction func sendMessage(sender: AnyObject) {
        var message = PFObject(className: "Message")
        message["text"] = messageField.text
        // message["user"] = PFUser.currentUser()
        message.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if (success) {
                self.messageField.text = ""
                self.view.endEditing(true)
            } else {
                // pop up alert
            }
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
