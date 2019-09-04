//
//  SubCategoryVM.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 29/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import Foundation
import Foundation
class SubCategoryVM {
    
    let apiService: CategoryServiceProtocol
    var refreshViewClosure: (() -> ())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?
    
    var subCategoryDetails = SubCategoryModel()
    
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    init( apiService: CategoryServiceProtocol = CategoryService()) {
        self.apiService = apiService
    }
    func getSubCategoryDetailsToAPIService(categoryID : String) {
        
        if !AppDelegate.appDelagate().isReachable() {
            self.alertMessage = internetConnectionWarningMessage
            return
        }
        self.isLoading = true
        self.apiService.getSubCategoryDetails(categoryID: categoryID) { [weak self] (response) in
            self?.isLoading = false
            if response.responseStatus == .success {
                let responseData = response.data as? SubCategoryModel
                if let _ = responseData?.status, let getDetails = responseData {
                    self?.subCategoryDetails = getDetails
                    self?.refreshViewClosure?()
                } else {
                    self?.alertMessage = responseData?.message
                }
            } else {
                self?.alertMessage = response.message
            }
        }
    }
}
