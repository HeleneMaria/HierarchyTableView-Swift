//
//  NormalObject.swift
//  HierarchyTable
//
//  Created by Helene Maria on 19/08/2014.
//  Copyright (c) 2014 HeleneMaria. All rights reserved.
//

import Foundation

class NormalObject: NSObject {
    var name : String = ""
    var childsObject : Array<NormalObject>= Array<NormalObject>()
    var leafsObject :Array<LeafObject> = Array<LeafObject>()
    
}
