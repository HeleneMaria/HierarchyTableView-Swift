//
//  GAHierarchyTableViewCell.swift
//  HierarchyTable
//
//  Created by Helene Maria on 19/08/2014.
//  Copyright (c) 2014 HeleneMaria. All rights reserved.
//

import UIKit

class HMHierarchyTableViewCell: UITableViewCell {
    @IBOutlet var expandButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    var node : HMHierarchyNode = HMHierarchyNode()
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder : aDecoder)
    }
    
    override init(frame : CGRect){
        super.init(frame: frame)
    }
    @IBAction func expandClick(sender: AnyObject) {
        self.node.isExpanded = !self.node.isExpanded
        self.setSelected(false, animated: true)
        //to notify the tableView that a click has been done
        NSNotificationCenter.defaultCenter().postNotificationName("expandButtonClick", object: self)
    }
    override func layoutSubviews() {
        self.bounds = CGRectMake(-CGFloat(node.level * 10), self.bounds.origin.y, 300-CGFloat(node.level * 20), self.bounds.height)
        super.layoutSubviews()
    }
    
    
}
