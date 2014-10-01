//
//  ReplyViewController.swift
//  twitter
//
//  Created by Niaz Jalal on 10/1/14.
//  Copyright (c) 2014 Niaz Jalal. All rights reserved.
//

import UIKit

class ReplyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var color: UIColor = UIColor(red:CGFloat(64/255.0), green: CGFloat(153/255.0), blue: CGFloat(1), alpha: CGFloat(1))
        
        self.navigationController?.navigationBar.barTintColor = color
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onReplyTweetCancelButton(sender: AnyObject) {
        
        println("Canceling retweet tweet...")
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onReplyTweetButton(sender: AnyObject) {
        
        //var message = self.tweetMsgTextView.text
        
        //TwitterClient.sharedInstance.tweetWithCompletion(message) { (tweet, error) -> () in
            
        //    self.dismissViewControllerAnimated(true, completion: nil)
        //}
        
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
