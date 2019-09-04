//
//  UserModel.swift
//  Phoenix Errands
//
//  Created by Raghav Beriwala on 27/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class UserModel: Mappable {

    var userName : String?
    var userPassword : String?
    var userFCMToken : String?
    init() {}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        userName <- map["userEmail"]
        userPassword <- map["userpassword"]
        userFCMToken <- map["userFCMToken"]
    }
}
