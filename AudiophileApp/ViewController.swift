//
//  ViewController.swift
//  AudiophileApp
//
//  Created by Paul Chong on 3/10/15.
//  Copyright (c) 2015 Paul Chong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {

    @IBOutlet weak var eventTableView: UITableView!
    
    // creating arrays for events and descriptions
    var rockEvents = [String]()
    var rockDescriptions = [String]()
    var edmEvents = [String]()
    var edmDescriptions = [String]()
    
    // define number of sections
    var sections = [String]()
    
    // menu pan code
    var panGestureRecognizer: UIPanGestureRecognizer!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        eventTableView.delegate = self
        eventTableView.dataSource = self
        eventTableView.rowHeight = 116
        sections = ["EDM", "Rock"]
        rockEvents = ["Rolling Stones", "White Stripes", "Black Keys", "Pink Floyd", "Jimi Hendrix"]
        rockDescriptions = ["Awesome", "Funky", "Mellow", "Psychedelic", "Solo"]
        edmEvents = ["Calvin Harris", "Armin Van Buuren", "Tiesto", "Skrillex"]
        edmDescriptions = ["Awesome", "Cool", "Mellow", "Rager"]
     
        // menu pan code
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "didPanMenu:")
        panGestureRecognizer.delegate = self

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return sections[0]
        } else {
            return sections[1]
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return edmEvents.count
        } else {
            return rockEvents.count
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("eventCellId") as EventCell
            cell.eventTitle.text = edmEvents[indexPath.row]
            cell.eventDescription.text = edmDescriptions[indexPath.row]
            return cell
        } else {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("eventCellId") as EventCell
        cell.eventTitle.text = rockEvents[indexPath.row]
        cell.eventDescription.text = rockDescriptions[indexPath.row]
        return cell
        }
    }

    @IBAction func didPanMenu(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        println("pan working")
        
        
        
//        if (sender.state == UIGestureRecognizerState.Began){
//            trayStartingYPanBegan = tray.frame.origin.y
//        } else if (sender.state == UIGestureRecognizerState.Changed){
//            finalTrayPositionY = trayStartingYPanBegan + translation.y
//            if (finalTrayPositionY < trayStartingY){
//                finalTrayPositionY = trayStartingYPanBegan + translation.y/10
//            }
//            tray.frame.origin.y = finalTrayPositionY
//        } else if sender.state == UIGestureRecognizerState.Ended {
//            if (velocity.y > 0){
//                finalTrayPositionY = 530
//                trayRotation = CGFloat(-180.0 * M_PI/180)
//            } else {
//                finalTrayPositionY = trayStartingY
//                trayRotation = CGFloat(0 * M_PI/180)
//            }
//            UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 30, options: nil, animations: { () -> Void in
//                self.tray.frame.origin.y = self.finalTrayPositionY
//                self.trayArrow.transform = CGAffineTransformMakeRotation(self.trayRotation)
//                }, completion: nil)
//            
//        }
        
    }
    
    
//    func didPanMenu(sender: UIPanGestureRecognizer) {
//        var location = sender.locationInView(view)
//        var translation = sender.translationInView(view)
//        if (sender.state == UIGestureRecognizerState.Began){
//            nonTraySmileyCenter = sender.view!.center
//        } else if (sender.state == UIGestureRecognizerState.Changed){
//            sender.view!.center = CGPoint(x: nonTraySmileyCenter.x + translation.x, y: nonTraySmileyCenter.y + translation.y)
//        } else if sender.state == UIGestureRecognizerState.Ended {
//            
//        }
//    }

}

