//
//  LoginVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 07/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
class LoginVC: UIViewController {
    @IBOutlet weak var loginTableView: UITableView!
    var userObject = UserModel()
    
    lazy var viewModel: LoginVM = {
        return LoginVM()
    }()
    var userDetails = UserResponse()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginTableView.delegate = self
        self.loginTableView.dataSource = self
        self.initializeViewModel()
        userObject.userName = "samir1104@gmail.com"
        userObject.userPassword = "Samir1103@1qaz"
        print(" login check")
    }
    
    @IBAction func btnCloseAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonLoginSubmitAction(_ sender: Any) {
        userObject.userFCMToken = ""
        viewModel.sendLoginCredentialsToAPIService(user: userObject)
    }
    
    func initializeViewModel() {
        
        viewModel.showAlertClosure = {[weak self]() in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    self?.showAlertWithSingleButton(title: commonAlertTitle, message: message, okButtonText: okText, completion: nil)
                }
            }
        }
        
        viewModel.updateLoadingStatus = {[weak self]() in
            DispatchQueue.main.async {
                
                let isLoading = self?.viewModel.isLoading ?? false
                if isLoading {
                    self?.addLoaderView()
                } else {
                    self?.removeLoaderView()
                }
            }
        }
        
        viewModel.refreshViewClosure = {[weak self]() in
            DispatchQueue.main.async {
                
                if  (self?.viewModel.userDetails.status) == 200 {
                    self!.userDetails = (self?.viewModel.userDetails)!
                    AppPreferenceService.setInteger(IS_LOGGED_IN, key: PreferencesKeys.loggedInStatus)
                    AppPreferenceService.setString(String((self?.viewModel.userDetails.id!)!), key: PreferencesKeys.userID)
                    AppPreferenceService.setString(String((self?.viewModel.userDetails.email!)!), key: PreferencesKeys.userName)
                    AppPreferenceService.setString(String((self?.viewModel.userDetails.authorizationToke!)!), key: PreferencesKeys.userToken)
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.openHomeViewController()
                }else{
                    self?.showAlertWithSingleButton(title: commonAlertTitle, message: (self?.viewModel.userDetails.message)!, okButtonText: okText, completion: nil)
                }
            }
        }
    }
}

extension LoginVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    //"leftmenu-icon-messages.png"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "LoginHeaderCell") as! LoginHeaderCell
            return Cell
        case 1:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "LoginEmailPasswordCell") as! LoginEmailPasswordCell
            Cell.txtFieldEmail.tag = 0
            Cell.txtFieldPassword.tag = 1
            Cell.txtFieldEmail.delegate = self
            Cell.txtFieldPassword.delegate = self
            Cell.initializeCellObject(cellDic : userObject)
            return Cell
        default:
            return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 212
        case 1:
            return 230
        default:
            return 0
        }
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let txtAfterUpdate = textField.text! as NSString
        let updateText = txtAfterUpdate.replacingCharacters(in: range, with: string) as NSString
        print("Updated TextField:: \(updateText)")
        switch textField.tag {
        case 0:
            userObject.userName = updateText as String
        case 1:
            userObject.userPassword = updateText as String
        default:
            break
        }
        return true
    }
}
