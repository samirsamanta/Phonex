//
//  ServiceVM.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 29/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import Foundation
class ServiceVM {
    
    let apiService: ServiceListServiceProtocol
    var refreshViewClosure: (() -> ())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?
    
    var serviceDetails = ServiceListModel()
    
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
    
    init( apiService: ServiceListServiceProtocol = ServiceListService()) {
        self.apiService = apiService
    }
    
    func getServiceDetailsToAPIService(subCategoryID : String) {
        
        if !AppDelegate.appDelagate().isReachable() {
            self.alertMessage = internetConnectionWarningMessage
            return
        }
        self.isLoading = true
        self.apiService.getServiceListDetails(subCategoryID: subCategoryID) { [weak self] (response) in
            self?.isLoading = false
            if response.responseStatus == .success {
                let responseData = response.data as? ServiceListModel
                if let _ = responseData?.status, let getDetails = responseData {
                    self?.serviceDetails = getDetails
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
