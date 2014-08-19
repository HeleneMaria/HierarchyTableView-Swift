//
//  HMHierarchyTableViewController.swift
//  HierarchyTable
//
//  Created by Helene Maria on 19/08/2014.
//  Copyright (c) 2014 HeleneMaria. All rights reserved.
//

import UIKit

protocol HMHierarchyTableDelegate{
    func selectedObject( obj : AnyObject!)
}

class HMHierarchyTableViewController: UITableViewController {
    
    var firstLevel : Array<NormalObject> = Array<NormalObject>(){
        didSet{
            //Create the nodes based on the objects set
            for obj in firstLevel{
                var object = obj as NormalObject
                var node = HMHierarchyNode(object: object, level : 0)
                createObjectChildNodeOf(node)
                createLeafChildNodeOf(node)
                firstLevelNodes.append(node)
            }
            fillDisplayArray()
            tableView.reloadData()

        }
    }
    var firstLevelNodes : Array<HMHierarchyNode> = Array<HMHierarchyNode>()
    var displayArray : NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("expendAction:"), name: "expandButtonClick", object: nil)
    }
    
    var delegate : HMHierarchyTableDelegate?
    
    //To create the node in displayArray based on the firstLevel array
    func createObjectChildNodeOf(node : HMHierarchyNode){
        var object = node.object as NormalObject
        var shouldBeExpanded = false
        
        if(object.childsObject.count>0){
            for child in object.childsObject {
                var nodeChild = HMHierarchyNode(object : (child as NormalObject), level : node.level+1 )
                createObjectChildNodeOf(nodeChild)
                createLeafChildNodeOf(nodeChild)
                node.childs.addObject(nodeChild)
            }
        }
    }

    func createLeafChildNodeOf(node : HMHierarchyNode){
        var object = node.object as NormalObject
        var shouldBeExpanded = false
        
        if(object.leafsObject.count>0){
            for leaf in object.leafsObject {
                var nodeChild = HMHierarchyNode(object : (leaf as LeafObject), level : node.level+1 )
                node.childs.addObject(nodeChild)
            }
        }
    }
    
    func fillDisplayArray() {
        displayArray = NSMutableArray()
        for node in firstLevelNodes {
            node.index = displayArray.count
            displayArray.addObject(node)
            if node.isExpanded {
                var arrayChild = Array<HMHierarchyNode>()
                for n in (node as HMHierarchyNode).childs {
                    arrayChild.append(n as HMHierarchyNode)
                }
                fillNodeWithChildrenArray(arrayChild)
                
            }
        }
    }
    
    func fillNodeWithChildrenArray(childs : Array<HMHierarchyNode>){
        for node in childs {
            (node as HMHierarchyNode).index = displayArray.count
            displayArray.addObject(node as HMHierarchyNode)
            if node.isExpanded {
                var arrayChild = Array<HMHierarchyNode>()
                for n in (node as HMHierarchyNode).childs {
                    arrayChild.append(n as HMHierarchyNode)
                }
                fillNodeWithChildrenArray(arrayChild)
            }
        }
    }



    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return displayArray.count
    }
    
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath : indexPath) as HMHierarchyTableViewCell
        var node = displayArray.objectAtIndex(indexPath.row) as HMHierarchyNode
        cell.node = node
        var obj : NormalObject? = node.object as? NormalObject
        if let normObj = obj {
            cell.nameLabel.text = normObj.name
            cell.expandButton.hidden = false
        }
        else{
            cell.nameLabel.text = (node.object as LeafObject).name
            cell.expandButton.hidden = true
        }
        if node.isExpanded {
            cell.expandButton.setBackgroundImage(UIImage(named: "arrowDown"), forState: UIControlState.Normal)
        }
        else{
            cell.expandButton.setBackgroundImage(UIImage(named: "arrowRight"), forState: UIControlState.Normal)
        }
                return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var object: AnyObject! = (displayArray[indexPath.row] as HMHierarchyNode).object
        delegate?.selectedObject(object)
    }
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 50
    }
    
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    
    func expendAction(sender : NSNotification){
        fillDisplayArray()
        tableView.reloadData()
    }
   
}
