//
//  TweetCell.swift
//  twitter
//
//  Created by Niaz Jalal on 9/29/14.
//  Copyright (c) 2014 Niaz Jalal. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profilePosterView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    var tweet: Tweet! {
        
        willSet(tweet) {
            loadValues(tweet)
        }
        
        didSet(value) {
            // do nothing
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func loadValues(tweet: Tweet) {
        
        self.profilePosterView.setImageWithURL(tweet.user?.profileImageURL as? NSURL)
        println("IMAGE: \(self.profilePosterView.setImageWithURL(tweet.user?.profileImageURL as? NSURL))")
        self.nameLabel.text = tweet.user?.name
        self.tweetLabel.text = tweet.text
    }
}
