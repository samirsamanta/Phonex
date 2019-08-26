//
//  APIConstants.swift
//  LastingVideoMemories
//
//  Created by on 05/10/18.
//  Copyright © 2018 iOS Dev. All rights reserved.
//

import Foundation

class APIConstants: NSObject {
    
    static let imgBaseURL = "https://mucapp.azurewebsites.net/"
    static let imgprescriptionBase = "https://mucapp.azurewebsites.net/content/labresults/"
    static let baseURL = "https://mucapp.azurewebsites.net/api"
    static let loginURL = "/user-login/"
    
    static func logInApi() -> String {
        return baseURL + loginURL
    }
}
