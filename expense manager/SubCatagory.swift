//
//  SubCatagory.swift
//  expense manager
//
//  Created by Mac on 2/15/20.
//

import Foundation
import RealmSwift

@objcMembers
class SubCatagory : Object {
    dynamic var id = UUID().uuidString
    dynamic var name = String()
    dynamic var icon = String()
    
    let catagory = LinkingObjects(fromType: Catagory.self, property: "subCatagories")
}
