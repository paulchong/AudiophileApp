//
//  EventCell.swift
//  AudiophileApp
//
//  Created by Paul Chong on 3/10/15.
//  Copyright (c) 2015 Paul Chong. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
            // Initialization code
        }

//    override func layoutSubviews() {
//        super.layoutSubviews()
//        swiperView?.frame = self.contentView.bounds
//    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
