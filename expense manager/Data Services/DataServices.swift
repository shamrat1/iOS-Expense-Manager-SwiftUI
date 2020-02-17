//
//  DataServices.swift
//  expense manager
//
//  Created by Mac on 2/16/20.
//

import Foundation
import RealmSwift

class DataServices {
    
    static func getCategories(){
        let realm = try! Realm()
        
        let data = realm.objects(Catagory.self)
        
//        return data
    }
}
