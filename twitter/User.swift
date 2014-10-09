//
//  User.swift
//  twitter
//
//  Created by Niaz Jalal on 9/28/14.
//  Copyright (c) 2014 Niaz Jalal. All rights reserved.
//

import UIKit

var _currentUser: User?
let currentUserKey = "kCurrentUserKey"
let userDidLoginNotification = "userDidLoginNotification"
let userDidLogoutNotification = "userDidLogoutNotification"

class User: NSObject {
    
    var dictionary: NSDictionary
    var name: String?
    var screenname: String?
    var profileImageURL: NSURL?
    var bannerImageURL: NSURL?
    var backgroundImageAvailable: Bool?
    var backgroundImageURL: NSURL?
    var bannerColor: UIColor?
    var tagline: String?
    var tweetCount: Int?
    var id: Int?
    var followersCount: Int?
    var followingCount: Int?
    var favoritesCount: Int?
    
    init(dictionary: NSDictionary) {
        
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        backgroundImageAvailable = dictionary["profile_use_background_image"] as? Bool
        if (backgroundImageAvailable == true) {
            backgroundImageURL = NSURL(string: dictionary["profile_background_image_url"] as String)

        }
        var bannerImageExists = dictionary["profile_banner_url"] as? String
        if (bannerImageExists != nil) {
            bannerImageURL = NSURL(string: dictionary["profile_banner_url"] as String)
        }
        bannerColor = UIColor(red:CGFloat(64/255.0), green: CGFloat(153/255.0), blue: CGFloat(1), alpha: CGFloat(1))
        profileImageURL = NSURL(string: dictionary["profile_image_url"] as String)
        tagline = dictionary["description"] as? String
        tweetCount = dictionary["statuses_count"] as? Int
        id = dictionary["id"] as? Int
        followersCount = dictionary["followers_count"] as? Int
        followingCount = dictionary["friends_count"] as? Int
        favoritesCount = dictionary["favourites_count"] as? Int
    }
    
    func logout() {
        
        User.currentUser = nil
        
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        
        NSNotificationCenter.defaultCenter().postNotificationName(userDidLogoutNotification, object: nil)
    }
    
    class var currentUser: User? {
        
        get {
            if _currentUser == nil {
        
                var data = NSUserDefaults.standardUserDefaults().objectForKey(currentUserKey) as? NSData
        
                if data != nil {
                    var dictionary = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as NSDictionary
        
                    _currentUser = User(dictionary: dictionary)
                }
            }
        
            return _currentUser
        }
        
        set (user) {
            
            _currentUser = user
            
            if _currentUser != nil {
                var data = NSJSONSerialization.dataWithJSONObject(user!.dictionary, options: nil, error: nil)
                
                NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
            } else {
                NSUserDefaults.standardUserDefaults().setObject(nil, forKey: currentUserKey)
            }
            
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}
