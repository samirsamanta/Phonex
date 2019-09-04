//
//  ContactVM.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 02/09/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import Foundation
import Foundation
class ContactVM {
    
    let apiService: ContactServicesProtocol
    var refreshViewClosure: (() -> ())?
    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?
    
    var contactDetails = ContactModel()
    
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
    
    init( apiService: ContactServicesProtocol = ContactServices()) {
        self.apiService = apiService
    }
    func getContactDetailsToAPIService() {
        
        if !AppDelegate.appDelagate().isReachable() {
            self.alertMessage = internetConnectionWarningMessage
            return
        }
        self.isLoading = true
        self.apiService.getContactDetails() { [weak self] (response) in
            self?.isLoading = false
            if response.responseStatus == .success {
                let responseData = response.data as? ContactModel
                if let _ = responseData?.status, let getDetails = responseData {
                    self?.contactDetails = getDetails
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
