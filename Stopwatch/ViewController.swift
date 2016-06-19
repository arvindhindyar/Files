//
//  ViewController.swift
//  Stopwatch
//
//  Created by Arvind Kumar on 22/05/16.
//  Copyright © 2016 hindyar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timeSec = 0
    
    var timeMin = 0
    
    var barTitle = String()
    
    var green = Int()
    
    var yellow = Int()
    
    var red = Int()
    
var timer=NSTimer()
    @IBOutlet weak var navigationBar: UINavigationItem!
    
      var time=0.0
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationBar.title = barTitle
        
    }
    func result(){
        timeSec += 1
        
        if (timeSec == 60)
        {
            timeSec = 0
            timeMin += 1
        }
        
        let timeNow =  NSString(format: "%02d:%02d", timeMin,timeSec)
        
        timerLabel.text="\(timeNow)"
        
        if timeMin == 1 && timeSec == 00{
        self.view.backgroundColor=UIColor.greenColor()
        }
        if timeMin == 01 && timeSec == 10{
        self.view.backgroundColor=UIColor.yellowColor()
        }
        if timeMin == 1 && timeSec == 15{
            self.view.backgroundColor=UIColor.redColor()
        }
    }
    @IBAction func play(sender: AnyObject) {
        timer=NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(self.result), userInfo: nil, repeats: true)
    }
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
    }
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
        timeSec = 0
        timeMin = 0
        let timeNow =  NSString(format: "%02d:%02d", timeMin,timeSec)
      timerLabel.text = "\(timeNow)"
         self.view.backgroundColor=UIColor.whiteColor()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

