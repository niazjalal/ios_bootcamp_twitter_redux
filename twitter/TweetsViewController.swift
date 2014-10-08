//
//  TweetsViewController.swift
//  twitter
//
//  Created by Niaz Jalal on 9/28/14.
//  Copyright (c) 2014 Niaz Jalal. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var SignOutButton: UIBarButtonItem!
    @IBOutlet weak var NewTweetButton: UIBarButtonItem!
    @IBOutlet weak var TweetsHomeLabel: UINavigationItem!

    
    var tweets: [Tweet]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "onTapUserImage:")
                
        var refresh: UIRefreshControl = UIRefreshControl()
        var color: UIColor = UIColor(red:CGFloat(64/255.0), green: CGFloat(153/255.0), blue: CGFloat(1), alpha: CGFloat(1))
        var textColor = [NSForegroundColorAttributeName: color]
        
        refresh.attributedTitle = NSAttributedString(string: "Pull to refresh", attributes: textColor)
        refresh.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        refresh.tintColor = color
        tableView.addSubview(refresh)
      
        self.navigationController?.navigationBar.barTintColor = color
        
        TwitterClient.sharedInstance.homeTimelineWithParams(nil) { (tweets, error) -> () in
            if tweets != nil {
                self.tweets = tweets
            }
            
            self.tableView.reloadData()
        }
        
        // Do any additional setup after loading the view.
    
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        println("ROWS: \(self.tweets?.count)")
        return self.tweets?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println("I'm at row: \(indexPath.row)")
        
        var cell = tableView.dequeueReusableCellWithIdentifier("TweetCell") as? TweetCell
        
        var tweet = self.tweets![indexPath.row] as Tweet
        
        cell?.tweet = tweet
        
        cell!.segueCallback = self.cellCallback
        
        return cell!
    }
    
    func cellCallback(tweet: Tweet) -> Void {
        
        println("Calling segue")
        self.performSegueWithIdentifier("loadProfileSegue", sender: tweet)
        println("Returned from segue call")
    }

    @IBAction func onLogout(sender: AnyObject) {
        
        User.currentUser?.logout()
    }
    
    @IBAction func onNewTweet(sender: AnyObject) {
        
        self.performSegueWithIdentifier("newTweetSegue", sender: self)
    }
    
    func onRefresh(sender: AnyObject) {
        
        var refresh = sender as UIRefreshControl
        refresh.endRefreshing()
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "tweetViewSegue" {
            
            var tweetViewController = segue.destinationViewController as TweetViewController
            
            let tweetPath = self.tableView.indexPathForSelectedRow() as NSIndexPath!
            let row = tweetPath.row
            
            var tweet = self.tweets![row]
            
            tweetViewController.tweet = tweet
            
        } else if segue.identifier == "loadProfileSegue" {
            
            var profileViewController = segue.destinationViewController as ProfileViewController
            
            profileViewController.user = (sender as Tweet).user
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
