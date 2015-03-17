//
//  DetailViewController.swift
//  AudiophileApp
//
//  Created by Paul Chong on 3/14/15.
//  Copyright (c) 2015 Paul Chong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailScrollView: UIScrollView!
    @IBOutlet weak var detailImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailScrollView.contentSize = detailImage.frame.size
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBackButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
