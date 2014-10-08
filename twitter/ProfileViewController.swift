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
        
        self.user = User.currentUser
        
        self.bannerPosterView.setImageWithURL(user?.bannerImageURL)
        self.thumbPosterView.setImageWithURL(user?.profileImageURL)
        self.profileNameLabel.text = user?.name
        self.profileScreennameLabel.text = user?.screenname
        self.tweetCountLabel.text = "\(user?.tweetCount)"
        self.followingCountLabel.text = "\(user?.followingCount)"
        self.followersLabelCount.text = "\(user?.followersCount)"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
