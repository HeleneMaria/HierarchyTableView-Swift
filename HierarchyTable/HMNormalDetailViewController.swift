//
//  HMNormalDetailViewController.swift
//  HierarchyTable
//
//  Created by Helene Maria on 19/08/2014.
//  Copyright (c) 2014 HeleneMaria. All rights reserved.
//

import UIKit

class HMNormalDetailViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    var object : NormalObject = NormalObject(){
        didSet{
            nameLabel.text = object.name
        }
    }
}
