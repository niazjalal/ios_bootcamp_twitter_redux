//
//  ProfileViewController.swift
//  twitter
//
//  Created by Niaz Jalal on 10/7/14.
//  Copyright (c) 2014 Niaz Jalal. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var bannerPosterView: UIImageView!
    @IBOutlet weak var thumbPosterView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileScreennameLabel: UILabel!
    @IBOutlet weak var tweetCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersLabelCount: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var color: UIColor = UIColor(red:CGFloat(64/255.0), green: CGFloat(153/255.0), blue: CGFloat(1), alpha: CGFloat(1))
        
        //self.user = User.currentUser
        
        if user == nil {
            user = User.currentUser
        }
        
        self.bannerPosterView.setImageWithURL(user.bannerImageURL!)
        println("\(user.bannerImageURL!)")
        self.thumbPosterView.setImageWithURL(user.profileImageURL!)
        self.profileNameLabel.text = "\(user.name!)"
        self.profileScreennameLabel.text = "@\(user.screenname!)"
        self.profileScreennameLabel.textColor = color
        self.tweetCountLabel.text = "\(user.tweetCount!)"
        println("\(tweetCountLabel.text)")
        self.followingCountLabel.text = "\(user.followingCount!)"
        println("\(followingCountLabel.text)")
        self.followersLabelCount.text = "\(user.followersCount!)"
        println("\(followersLabelCount.text)")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little pSome	UIImageView	0x000000010b1199d8	0x000000010b1199d8reparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
