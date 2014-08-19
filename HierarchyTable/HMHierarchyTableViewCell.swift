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
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        var indentPoints = node.level * 40;
//        self.expandButton.frame = CGRectMake(CGFloat(indentPoints), self.expandButton.frame.origin.y,30,30) as CGRect
////        self.contentView.frame = CGRectMake(CGFloat(indentPoints), self.contentView.frame.origin.y,CGFloat(widthT),self.contentView.frame.size.height) as CGRect
//        println("layoutsubviews \(nameLabel.text)")
//    }
    
    
}
