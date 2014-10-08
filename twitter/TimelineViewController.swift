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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.timelineViewXConstraint.constant = 0
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
