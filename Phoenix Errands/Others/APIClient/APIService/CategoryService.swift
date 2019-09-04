//
//  CategoryService.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 29/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol CategoryServiceProtocol {
    func getCategoryDetails(completion: RequestCompletionHandler?)
    func getSubCategoryDetails(categoryID : String, completion: RequestCompletionHandler?)
}
class CategoryService: CategoryServiceProtocol {
    
    func getCategoryDetails(completion: RequestCompletionHandler?) {
        let categoryApi = APIConstants.categoryApi()
        let header = ["Content-Type" : "application/json" , "Authorization" : "Bearer " + UserDefaults.standard.string(forKey: PreferencesKeys.userToken)!]
        Alamofire.request(categoryApi, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseObject {(response: DataResponse<CategoryModel>) in
            print("loginApi==>\(categoryApi)")
            let loginApiResponse : Response!
            
            var responseStausCode: Int = 1
            var failureMessage: String = ""
            
            if let message = response.error?.localizedDescription {
                failureMessage = message
            }
            if let statusCode = response.response?.statusCode {
                responseStausCode = statusCode
            }
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            switch(response.result) {
            case .success(let data):
                loginApiResponse = Response.init(code: .success, responseStatusCode: responseStausCode, message: failureMessage, data: data)
            case .failure( _):
                loginApiResponse = Response.init(code: .failure, responseStatusCode: responseStausCode, message: failureMessage, data: nil)
            }
            completion?(loginApiResponse)
        }
    }
    
    func getSubCategoryDetails( categoryID : String, completion: RequestCompletionHandler?) {
        let subCategoryApi = APIConstants.subCategoryApi() + categoryID
        let header = ["Content-Type" : "application/json" , "Authorization" : "Bearer " + UserDefaults.standard.string(forKey: PreferencesKeys.userToken)!]
        Alamofire.request(subCategoryApi, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseObject {(response: DataResponse<SubCategoryModel>) in
            print("loginApi==>\(subCategoryApi)")
            let loginApiResponse : Response!
            
            var responseStausCode: Int = 1
            var failureMessage: String = ""
            
            if let message = response.error?.localizedDescription {
                failureMessage = message
            }
            if let statusCode = response.response?.statusCode {
                responseStausCode = statusCode
            }
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
            switch(response.result) {
            case .success(let data):
                loginApiResponse = Response.init(code: .success, responseStatusCode: responseStausCode, message: failureMessage, data: data)
            case .failure( _):
                loginApiResponse = Response.init(code: .failure, responseStatusCode: responseStausCode, message: failureMessage, data: nil)
            }
            completion?(loginApiResponse)
        }
    }
}
