//
//  HMObjectDetailViewController.swift
//  HierarchyTable
//
//  Created by Helene Maria on 19/08/2014.
//  Copyright (c) 2014 HeleneMaria. All rights reserved.
//

import UIKit

class HMObjectDetailViewController: UIViewController, HMHierarchyTableDelegate {
    var selectedObject : AnyObject?

    func selectedObject( obj : AnyObject!){
        selectedObject = obj
        println("views \(self.view.subviews.count)")
        
        if let test = selectedObject as? NormalObject {
            var storyboard = UIStoryboard(name: "Main", bundle:nil)
            var detailController = storyboard.instantiateViewControllerWithIdentifier("HMNormalDetailViewController") as HMNormalDetailViewController
            detailController.view.frame = self.view.bounds
            detailController.object = test
            
            self.view.addSubview(detailController.view)
            self.addChildViewController(detailController)
            detailController.didMoveToParentViewController(self)
        }
        else{
            var storyboard = UIStoryboard(name: "Main", bundle:nil)
            var detailController = storyboard.instantiateViewControllerWithIdentifier("HMLeafDetailViewController") as HMLeafDetailViewController
            detailController.view.frame = self.view.bounds
            detailController.leaf = selectedObject as LeafObject
            
            self.view.addSubview(detailController.view)
            self.addChildViewController(detailController)
            detailController.didMoveToParentViewController(self)

        }
    }
}
