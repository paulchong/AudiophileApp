//
//  ViewController.swift
//  AudiophileApp
//
//  Created by Paul Chong on 3/10/15.
//  Copyright (c) 2015 Paul Chong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var eventTableView: UITableView!
    
    // creating arrays for events and descriptions
    var rockEvents = [String]()
    var rockDescriptions = [String]()
    var edmEvents = [String]()
    var edmDescriptions = [String]()
    
    // define number of sections
    var sections = [String]()
    
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

}

