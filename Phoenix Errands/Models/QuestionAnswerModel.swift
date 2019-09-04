//
//  QuestionAnswerModel.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 03/09/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class QuestionAnswerModel: Mappable {

    var status : Int?
    var totalQuestionSets : Int?
    var message : String?
    var questionSetUserArr : [QuestionAnswerUserList]?
    var questionSetProviderArr : [QuestionAnswerProviderList]?
    
    init() {}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        totalQuestionSets <- map["totalQuestionSets"]
        message <- map["message"]
        questionSetUserArr <- map["questionSetforusers"]
        questionSetProviderArr <- map["questionSetforprovider"]
    }
}

class QuestionAnswerUserList: Mappable {
    
    var id : Int?
    var service_id : String?
    var question : String?
    var type : String?
    var answer : String?
    var questionfor : String?
    var created_at : String?
    var updated_at : String?
    var array_answer : String?
    
    init() {}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        service_id <- map["service_id"]
        question <- map["question"]
        type <- map["type"]
        answer <- map["answer"]
        questionfor <- map["questionfor"]
        created_at <- map["created_at"]
        updated_at <- map["updated_at"]
        array_answer <- map["array_answer"]
    }
}
    
class QuestionAnswerProviderList: Mappable {
    
    var id : Int?
    var service_id : String?
    var question : String?
    var type : String?
    var answer : String?
    var questionfor : String?
    var created_at : String?
    var updated_at : String?
    var array_answer : String?
    
    init() {}
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        service_id <- map["service_id"]
        question <- map["question"]
        type <- map["type"]
        answer <- map["answer"]
        questionfor <- map["questionfor"]
        created_at <- map["created_at"]
        updated_at <- map["updated_at"]
        array_answer <- map["array_answer"]
        
    }
}
