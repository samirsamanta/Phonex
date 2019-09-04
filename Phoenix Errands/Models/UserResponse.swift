//
//  UserResponse.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 28/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class UserResponse: Mappable {
    
    var status : Int?
    var isSuccess : String?
    var message : String?
    
    var id : Int?
    var userFirstName : String?
    var userLastName : String?
    var email : String?
    var phone : String?
    var userFCMToken : String?
    var address : String?
    var created_at : String?
    var updated_at : String?
    var authorizationToke : String?
    
    init() {}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        isSuccess <- map["isSuccess"]
        message <- map["message"]
        
        id <- map["userdetail.id"]
        userFirstName <- map["userdetail.userFirstName"]
        userLastName <- map["userdetail.userLastName"]
        email <- map["userdetail.email"]
        phone <- map["userdetail.phone"]
        userFCMToken <- map["userdetail.userFCMToken"]
        address <- map["userdetail.address"]
        created_at <- map["userdetail.created_at"]
        updated_at <- map["userdetail.updated_at"]
        authorizationToke <- map["userdetail.authorizationToke"]
    }
}
