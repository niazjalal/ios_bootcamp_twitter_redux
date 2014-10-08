//
//  ReplyViewController.swift
//  twitter
//
//  Created by Niaz Jalal on 10/1/14.
//  Copyright (c) 2014 Niaz Jalal. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {
    
    @IBOutlet weak var profilePosterView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileScreennameLabel: UILabel!
    @IBOutlet weak var replyTweetTextView: UITextView!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var color: UIColor = UIColor(red:CGFloat(64/255.0), green: CGFloat(153/255.0), blue: CGFloat(1), alpha: CGFloat(1))
        
        self.navigationController?.navigationBar.barTintColor = color
        
        var user = User.currentUser

        self.profilePosterView.setImageWithURL(user?.profileImageURL)
        self.profileNameLabel.text = user?.name
        self.profileScreennameLabel.text = "@\(user?.screenname as String!)"
        self.profileScreennameLabel.textColor = color
        self.replyTweetTextView.text = "@\(tweet.user?.screenname as String!) "

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onReplyTweetCancelButton(sender: AnyObject) {
        
        println("Canceling retweet tweet...")
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onReplyTweetButton(sender: AnyObject) {
        
        var message = self.replyTweetTextView.text
        
        TwitterClient.sharedInstance.tweetReplyWithCompletion(message, replyAddress: tweet.user!) { (tweet, error) -> () in
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        dismissViewControllerAnimated(true, completion: nil)
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
