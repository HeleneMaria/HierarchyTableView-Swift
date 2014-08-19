//
//  GAHierarchyNode.swift
//  HierarchyTable
//
//  Created by Helene Maria on 19/08/2014.
//  Copyright (c) 2014 HeleneMaria. All rights reserved.
//

import UIKit

class HMHierarchyNode: NSObject {
    var level = 0
    var isExpanded = false
    var object : AnyObject?
    var index = 0
    var childs : NSMutableArray = NSMutableArray()
    
    init(object : NSObject, level : Int){
        super.init()
        self.object = object
        self.level = level
    }
    
    override init(){
        super.init()
    }

}
