//
//  CalisanlarModel.swift
//  CompanyRealm
//
//  Created by Salih on 5.03.2023.
//

import Foundation
import RealmSwift

class CalisanlarModel:Object {
    
    @objc dynamic var calisanId = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var role = ""
    
    
    override class func primaryKey() -> String? {
        return "calisanId"
    }
    override class func indexedProperties() -> [String] {
        return ["role"]
    }
    
}
