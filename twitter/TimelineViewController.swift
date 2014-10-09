//
//  TimelineViewController.swift
//  twitter
//
//  Created by Niaz Jalal on 10/7/14.
//  Copyright (c) 2014 Niaz Jalal. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var timelineViewXConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var timelineButton: UIButton!
    @IBOutlet weak var mentionsButton: UIButton!
    @IBOutlet weak var profilePosterView: UIImageView!
    @IBOutlet weak var profileNameButton: UIButton!
    @IBOutlet weak var profileScreennameLabel: UILabel!
    
    var profileUser: User!
    
    var timelineVC: UINavigationController!
    var profileVC: ProfileViewController!
    var mentionsVC: UINavigationController!
    
    var storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    var activeViewController: UIViewController? {
        
        didSet(oldViewControllerOrNil) {
            
            if let oldVC = oldViewControllerOrNil {
                
                oldVC.willMoveToParentViewController(nil)
                
                oldVC.view.removeFromSuperview()
                
                oldVC.removeFromParentViewController()
            }
            
            if let newVC = activeViewController {
                
                self.addChildViewController(newVC)
                
                newVC.view.autoresizingMask = .FlexibleWidth | .FlexibleHeight
                
                newVC.view.frame = self.contentView.bounds
                
                self.contentView.addSubview(newVC.view)
                
                newVC.didMoveToParentViewController(self)
            }
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var color: UIColor = UIColor(red:CGFloat(64/255.0), green: CGFloat(153/255.0), blue: CGFloat(1), alpha: CGFloat(1))
        
         var user = User.currentUser
//        println("USER: \(self.user)")

        self.profileNameButton.setTitle(user!.name, forState: UIControlState.Normal)
        
        self.profileScreennameLabel.text = "@" + user!.screenname! as String
        
        self.profileScreennameLabel.textColor = color
        
        self.profilePosterView.setImageWithURL(user!.profileImageURL)
        
        self.timelineVC = self.storyBoard.instantiateViewControllerWithIdentifier("TweetsNavigationController") as UINavigationController
        
        var tVC = self.timelineVC.viewControllers[0] as TweetsViewController
        
        tVC.isMentions = false
        
        profileVC = self.storyBoard.instantiateViewControllerWithIdentifier("ProfileViewController") as ProfileViewController
        
        self.mentionsVC = self.storyBoard.instantiateViewControllerWithIdentifier("TweetsNavigationController") as UINavigationController
        
        var mVC = self.mentionsVC.viewControllers[0] as TweetsViewController
        
        mVC.isMentions = true
        
        self.timelineViewXConstraint.constant = 0
        
        self.activeViewController = timelineVC

        if self.profileUser != nil {
            
            self.profileVC.user = self.profileUser
            
            self.activeViewController = self.profileVC
        } else {
            
            self.activeViewController = timelineVC
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pullMenu(sender: UISwipeGestureRecognizer) {
        
        if sender.state == .Ended {
            
            UIView.animateWithDuration(0.35, animations: {
                
                self.timelineViewXConstraint.constant = -160
                
                self.view.layoutIfNeeded()
            })
        }
    }

    @IBAction func menuButtonPressed(sender: UIButton) {

        if sender == profileNameButton {
            
            println("profile pressed!")
            
            self.profileUser = nil
            
            self.activeViewController = profileVC
        } else if sender == timelineButton {
            
            println("timeline pressed!")
            
            self.activeViewController = timelineVC
        } else if sender == mentionsButton {
            
            println("mentions pressed!")
            
            self.activeViewController = mentionsVC
        } else {
            
            println("unknown button pressed!")
        }
        
        UIView.animateWithDuration(0.35, animations: {
            
            self.timelineViewXConstraint.constant = 0
            
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func onSignOut(sender: AnyObject) {
        
        User.currentUser?.logout()
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
