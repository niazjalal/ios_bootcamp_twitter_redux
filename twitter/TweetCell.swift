//
//  TweetCell.swift
//  twitter
//
//  Created by Niaz Jalal on 9/29/14.
//  Copyright (c) 2014 Niaz Jalal. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell, UIGestureRecognizerDelegate {

    @IBOutlet weak var profilePosterView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var replyImageButton: UIButton!
    @IBOutlet weak var retweetImageButton: UIButton!
    @IBOutlet weak var favoriteImageButton: UIButton!
    
    var segueCallback: ((tweet: Tweet) -> Void)?
    
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
        
        self.profilePosterView.setImageWithURL(tweet.user?.profileImageURL)
        self.nameLabel.text = tweet.user?.name
        self.screennameLabel.text = "@\(tweet.user?.screenname as String!)"
        self.createdLabel.text = tweet.createdAt?.timeAgo()
        self.tweetLabel.text = tweet.text
        self.replyImageButton.titleLabel?.text = ""
        self.replyImageButton.setImage(UIImage(named: "reply.png"), forState: UIControlState.Normal)
        self.retweetImageButton.titleLabel?.text = ""
        self.retweetImageButton.setImage(UIImage(named: "retweet.png"), forState: UIControlState.Normal)
        self.favoriteImageButton.titleLabel?.text = ""
        self.favoriteImageButton.setImage(UIImage(named: "favorite.png"), forState: UIControlState.Normal)
        self.favoriteImageButton.setImage(UIImage(named: "favorited.png"), forState: UIControlState.Highlighted)
        
        var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("onTapUserImage:"))
        
        tapGestureRecognizer.delegate = self
        
        profilePosterView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func onTapUserImage(sender: UITapGestureRecognizer) {
        
        println("onTapUserImage() called")
        
        self.segueCallback!(tweet: self.tweet)
    }
}
