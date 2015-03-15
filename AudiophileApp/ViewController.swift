//
//  ViewController.swift
//  AudiophileApp
//
//  Created by Paul Chong on 3/10/15.
//  Copyright (c) 2015 Paul Chong. All rights reserved.

//  BACK:  create container for filter view - make bottom slightly opaque
//

import UIKit
import MCSwipeTableViewCell

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {

    @IBOutlet weak var homeView: UIView!
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
    var finalPositionX: CGFloat!
    var homeViewStartingXPanBegan: CGFloat!
    var homeViewStartingX: CGFloat!

    
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
        homeViewStartingX = homeView.frame.origin.x

        
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

        var cell = tableView.dequeueReusableCellWithIdentifier("swipeycell") as MCSwipeTableViewCell?
        if cell == nil {
            cell = MCSwipeTableViewCell()
        }
        
        cell!.setSwipeGestureWithView(UIView(), color: UIColor.greenColor(), mode: MCSwipeTableViewCellMode.Exit, state: MCSwipeTableViewCellState.State1, completionBlock: { cell, state, mode in
            self.performSegueWithIdentifier("detailSegue", sender: self)
            println("completion left to right")
        })
        
        cell!.setSwipeGestureWithView(UIView(), color: UIColor.blueColor(), mode: MCSwipeTableViewCellMode.Switch, state: MCSwipeTableViewCellState.State3, completionBlock: { cell, state, mode in
            println("completion right to left")
        })
        
        if indexPath.section == 0 {
            cell!.textLabel?.text = edmEvents[indexPath.row]
            cell!.detailTextLabel?.text = edmDescriptions[indexPath.row]
        } else {
            cell!.textLabel?.text = rockEvents[indexPath.row]
            cell!.detailTextLabel?.text = rockDescriptions[indexPath.row]
        }
        
        return cell!

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("detailSegue", sender: self)
    }

    @IBAction func didPanMenu(sender: UIPanGestureRecognizer) {
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        println("pan working")
        
        
        if (sender.state == UIGestureRecognizerState.Began) {
            homeViewStartingXPanBegan = homeView.frame.origin.x
        } else if (sender.state == UIGestureRecognizerState.Changed) {
            finalPositionX = homeViewStartingXPanBegan + translation.x
            if (finalPositionX < homeViewStartingX){
                finalPositionX = homeViewStartingXPanBegan + translation.x/2
            }
            homeView.frame.origin.x = finalPositionX
        } else if (sender.state == UIGestureRecognizerState.Ended) {
            if (velocity.x > 0){
                finalPositionX = 290
            } else {
                finalPositionX = homeViewStartingX
            }
            UIView.animateWithDuration(0.2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: nil, animations: { () -> Void in
                self.homeView.frame.origin.x = self.finalPositionX
                }, completion: nil)
            
        }
        
    }

}

