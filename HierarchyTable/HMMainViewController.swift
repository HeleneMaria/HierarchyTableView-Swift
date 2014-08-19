//
//  ViewController.swift
//  HierarchyTable
//
//  Created by Helene Maria on 19/08/2014.
//  Copyright (c) 2014 HeleneMaria. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HMHierarchyTableDelegate {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        var firstLevel : Array<NormalObject> = Array<NormalObject>()
        //Fill the hierarchy with fake object
        for i in 0...10 {
            var obj = NormalObject()
            obj.name = "Object \(i)"
            addChildToObject(&obj)
            firstLevel.append(obj)
        }

        
        // Do any additional setup after loading the view, typically from a nib.
        var tableController = self.childViewControllers[0] as HMHierarchyTableViewController
        tableController.firstLevel = firstLevel
        
        var detailController = self.childViewControllers[1] as HMObjectDetailViewController
        tableController.delegate = detailController
    }
    
    //To fill the hierarchy with fake objects
    func addChildToObject(inout objectParent : NormalObject){
        
        for i in 0...10 {
            var obj = NormalObject()
            obj.name = "\(objectParent.name).\(i)"
            addLeafToObject(&obj)
            objectParent.childsObject.append(obj)
        }
    }
    func addLeafToObject(inout objectParent : NormalObject){
        for i in 0...10 {
            var leafObj = LeafObject()
            leafObj.name = "\(objectParent.name).\(i) LEAF"
            objectParent.leafsObject.append(leafObj)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK - HMHierarchyTableDelegate
    func selectedObject( obj : AnyObject!){
        
    }

}

