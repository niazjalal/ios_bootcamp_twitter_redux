//
//  TweetsViewController.swift
//  twitter
//
//  Created by Niaz Jalal on 9/28/14.
//  Copyright (c) 2014 Niaz Jalal. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {

    @IBOutlet weak var SignOutButton: UIBarButtonItem!
    @IBOutlet weak var NewTweetButton: UIBarButtonItem!
    @IBOutlet weak var TweetsHomeLabel: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var color: UIColor = UIColor(red:CGFloat(64/255.0), green: CGFloat(153/255.0), blue: CGFloat(1), alpha: CGFloat(1))
        
        self.navigationController?.navigationBar.barTintColor = color
        //SignOutButton.tintColor = UIColor.whiteColor()
        //NewTweetButton.tintColor = UIColor.whiteColor()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLogout(sender: AnyObject) {
        
        User.currentUser?.logout()
    }
    
    @IBAction func onNewTweet(sender: AnyObject) {
        
        self.performSegueWithIdentifier("newTweetSegue", sender: self)
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
