//
//  ContactModel.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 02/09/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class ContactModel: Mappable {

    var status : Int?
    var message : String?
    var contactArr : [ContactList]?
    
    init() {}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        contactArr <- map["contactList"]
    }
}

class ContactList: Mappable {
    var contactID : Int?
    var contactName : String?
    var contactImage : String?
    var contactTotalRating : Int?
    var contactRating : String?
    
    init() {}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        contactID <- map["contactID"]
        contactName <- map["contactName"]
        contactImage <- map["contactImage"]
        contactTotalRating <- map["contactTotalRating"]
        contactRating <- map["contactRating"]
        
    }
}
