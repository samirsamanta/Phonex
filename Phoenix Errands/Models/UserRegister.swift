//
//  UserRegister.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 28/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class UserRegister: Mappable {
    
    var userFirstName : String?
    var userLastName : String?
    var userEmail : String?
    var userpassword : String?
    var userPhone : String?
    var userFCMToken : String?
    
    
    init() {}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        userFirstName <- map["userFirstName"]
        userLastName <- map["userLastName"]
        userEmail <- map["userEmail"]
        userpassword <- map["userpassword"]
        userPhone <- map["userPhone"]
        userFCMToken <- map["userFCMToken"]
    }
}
