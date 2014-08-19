//
//  HMLeafDetailViewController.swift
//  HierarchyTable
//
//  Created by Helene Maria on 19/08/2014.
//  Copyright (c) 2014 HeleneMaria. All rights reserved.
//

import UIKit

class HMLeafDetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    var leaf : LeafObject = LeafObject(){
        didSet{
            nameLabel.text = leaf.name
        }
    }

}
