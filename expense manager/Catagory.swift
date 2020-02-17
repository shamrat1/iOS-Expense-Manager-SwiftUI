//
//  Catagory.swift
//  expense manager
//
//  Created by Mac on 2/15/20.
//

import Foundation
import RealmSwift

@objcMembers
class Catagory : Object, Identifiable {
    dynamic var id = UUID().uuidString
    dynamic var name = String()
    dynamic var icon = String()
    
    let subCatagories = List<SubCatagory>()
    
}
