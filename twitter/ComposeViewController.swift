//
//  ComposeViewController.swift
//  twitter
//
//  Created by Niaz Jalal on 9/29/14.
//  Copyright (c) 2014 Niaz Jalal. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var tweetMsgTextView: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        var color: UIColor = UIColor(red:CGFloat(64/255.0), green: CGFloat(153/255.0), blue: CGFloat(1), alpha: CGFloat(1))
        
        // Do any additional setup after loading the view.
        var user = User.currentUser
        
        self.userImageView.setImageWithURL(user?.profileImageURL)
        self.nameLabel.text = user?.name
        self.screennameLabel.text = "@\(user?.screenname as String!)"
        self.screennameLabel.textColor = color
        self.tweetMsgTextView.textColor = UIColor.blueColor()
        self.tweetMsgTextView.text = ""
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancelButton(sender: AnyObject) {
        
        println("Canceling new composed tweet...")
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onTweetButton(sender: AnyObject) {
        
        println("Tweeting new composed tweet...")
        
        var message = self.tweetMsgTextView.text
        
        TwitterClient.sharedInstance.tweetWithCompletion(message) { (tweet, error) -> () in
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
