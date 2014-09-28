//
//  TwitterClient.swift
//  twitter
//
//  Created by Niaz Jalal on 9/28/14.
//  Copyright (c) 2014 Niaz Jalal. All rights reserved.
//

import UIKit

let twitterBaseURL = NSURL(string: "https://api.twitter.com")
let twitterConsumerKey = "bEgo3rWghf5z6uEpHtCNLf6GD"
let twitterConsumerSecret = "zSj57xcsWhDgrnHU61YUtlO72vzUB324kMYrCsKfvtQ0Kszkh1"

class TwitterClient: BDBOAuth1RequestOperationManager {
   
    class var sharedInstance: TwitterClient {
        
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        
        return Static.instance
    }
}
