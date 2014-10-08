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
    
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var timelineButton: UIButton!
    
    @IBOutlet weak var mentionsButton: UIButton!

    var timelineVC: UIViewController!
    var profileVC: UIViewController!
    var mentionsVC: UIViewController!
    
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

        timelineVC = self.storyBoard.instantiateViewControllerWithIdentifier("TweetsViewController") as UIViewController
        profileVC = self.storyBoard.instantiateViewControllerWithIdentifier("ProfileViewController") as UIViewController
        mentionsVC = self.storyBoard.instantiateViewControllerWithIdentifier("ProfileViewController") as UIViewController
        
        self.timelineViewXConstraint.constant = 0
        
        self.activeViewController = timelineVC
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pullMenu(sender: UISwipeGestureRecognizer) {
        
        if sender.state == .Ended {
            self.timelineViewXConstraint.constant = -160
        }
    }

    @IBAction func menuButtonPressed(sender: UIButton) {
        
        if sender == profileButton {
            println("profile pressed!")
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
