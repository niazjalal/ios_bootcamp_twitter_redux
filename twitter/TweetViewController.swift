//
//  TweetViewController.swift
//  twitter
//
//  Created by Niaz Jalal on 9/29/14.
//  Copyright (c) 2014 Niaz Jalal. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    @IBOutlet weak var userPosterView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userScreennameLabel: UILabel!
    @IBOutlet weak var creationLabel: UILabel!
    @IBOutlet weak var replyMsgLabel: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var tweet: Tweet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var color: UIColor = UIColor(red:CGFloat(64/255.0), green: CGFloat(153/255.0), blue: CGFloat(1), alpha: CGFloat(1))
        
        self.navigationController?.navigationBar.barTintColor = color

        // Do any additional setup after loading the view.
        
        self.userPosterView.setImageWithURL(self.tweet?.user?.profileImageURL)
        self.usernameLabel.text = self.tweet?.user?.name as String!
        self.userScreennameLabel.text = "@\(self.tweet?.user?.screenname as String!)"
        self.userScreennameLabel.textColor = color
        self.creationLabel.text = self.tweet?.createdAt?.timeAgo()
        self.replyMsgLabel.text = self.tweet?.text as String!
        self.replyButton.titleLabel?.text = ""
        self.replyButton.setImage(UIImage(named: "reply.png"), forState: UIControlState.Normal)
        self.retweetButton.titleLabel?.text = ""
        self.retweetButton.setImage(UIImage(named: "retweet.png"), forState: UIControlState.Normal)
        self.favoriteButton.titleLabel?.text = ""
        self.favoriteButton.setImage(UIImage(named: "favorite.png"), forState: UIControlState.Normal)
        self.favoriteButton.setImage(UIImage(named: "favorited.png"), forState: UIControlState.Highlighted)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onReplyButton(sender: AnyObject) {
        
       self.performSegueWithIdentifier("replyTweetSegue", sender: self)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "replyTweetSegue" {
            var navController = segue.destinationViewController as UINavigationController
            var tweetReplyController = navController.viewControllers[0] as ReplyViewController
            tweetReplyController.tweet = tweet
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
