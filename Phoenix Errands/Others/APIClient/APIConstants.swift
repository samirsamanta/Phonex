//
//  APIConstants.swift
//  LastingVideoMemories
//
//  Created by on 05/10/18.
//  Copyright © 2018 iOS Dev. All rights reserved.
//

import Foundation

class APIConstants: NSObject {
    
    static let baseURL = "http://phoenix.smtechnoservice.com/api/"
    static let baseImageURL = "http://phoenix.smtechnoservice.com/"

    static let introURL = "introduction"
    static let loginURL = "userlogin"
    static let registerURL = "userregister"
    static let categoryURL = "category"
    static let subCategoryURL = "subcategory/"
    static let serviceURl = "servicebysubcategory/"
    static let skillURl = "skill"
    static let contactURl = "contact"
    static let questionAnswerURl = "questionsets/"
    static let forgotPasswordURl = "forgetpassword"
    
    
    static func introApi() -> String {
        return baseURL + introURL
    }
    
    static func logInApi() -> String {
        return baseURL + loginURL
    }
    static func registerApi() -> String {
        return baseURL + registerURL
    }
    static func categoryApi() -> String {
        return baseURL + categoryURL
    }
    static func subCategoryApi() -> String {
        return baseURL + subCategoryURL
    }
    static func serviceApi() -> String {
        return baseURL + serviceURl
    }
    static func skillListApi() -> String {
        return baseURL + skillURl
    }
    static func contactListApi() -> String {
        return baseURL + contactURl
    }
    static func questionAnsweApi() -> String {
        return baseURL + questionAnswerURl
    }
    static func forgotPasswordApi() -> String {
        return baseURL + forgotPasswordURl
    }
}
