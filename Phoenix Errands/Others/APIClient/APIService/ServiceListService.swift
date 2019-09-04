//
//  ServiceListService.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 29/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol ServiceListServiceProtocol {
    func getServiceListDetails(subCategoryID : String, completion: RequestCompletionHandler?)
}
class ServiceListService: ServiceListServiceProtocol {
    
    func getServiceListDetails( subCategoryID : String, completion: RequestCompletionHandler?) {
        let subCategoryApi = APIConstants.serviceApi() + subCategoryID
        let header = ["Content-Type" : "application/json" , "Authorization" : "Bearer " + UserDefaults.standard.string(forKey: PreferencesKeys.userToken)!]
        Alamofire.request(subCategoryApi, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseObject {(response: DataResponse<ServiceListModel>) in
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
