//
//  LoginVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 07/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit
import GoogleSignIn

class LoginVC: UIViewController
{
    @IBOutlet weak var loginTableView: UITableView!
    var userObject = UserModel()
    
    lazy var viewModel: LoginVM = {
        return LoginVM()
    }()
    var userDetails = UserResponse()
    var fbdataDict = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginTableView.delegate = self
        self.loginTableView.dataSource = self
        self.initializeViewModel()
        userObject.userName = "samir1104@gmail.com"
        userObject.userPassword = "Samir1103@1qaz"
        print("login check")
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
    func logInWithGmailAction() {
        GIDSignIn.sharedInstance().clientID = "321505110953-rrdi1bhiec35e9usncs01si24sdoh67j.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().signIn()
    }
    
    func logInWithFaceBookAction()
    {
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.loginBehavior = LoginBehavior.browser
        fbLoginManager.logOut()
        fbLoginManager.logIn(permissions: ["public_profile","email"], from: self) { (result, error) -> Void in
            if error != nil {
                self.dismiss(animated: true, completion: nil)
            }
            else if (result?.isCancelled)! {
                self.dismiss(animated: true, completion: nil)
            }
            else
            {
                self.getFBUserData()
            }
        }
    }
    func getFBUserData()
    {
        GraphRequest(graphPath: "me?fields", parameters: ["fields": "id, name , first_name, last_name, email"]).start(completionHandler: { (connection, result, error) -> Void in
            if (error == nil){
                let fbDetails = result as! NSDictionary
                self.fbdataDict = fbDetails as! [String : Any]
                print("fbdataDict==>\(self.fbdataDict)")
                print("first_name==>\(self.fbdataDict["first_name"] as! String)")
                //                let params = UserRegistration()
                //                params.FirstName = (self.fbdataDict["first_name"] as! String)
                //                params.LastName = (self.fbdataDict["last_name"] as! String)
                //                params.EmailID = (self.fbdataDict["email"] as! String)
                //                params.SocialID = (self.fbdataDict["id"] as! String)
                //                params.FcmToken = AppPreferenceService.getString(PreferencesKeys.FCMTokenDeviceID)
                //                params.SocialType = "Facebook"
                //self.googleSignInViewModel.sendSocialUserSignUpCredentialsToAPIService(user: params)
            }
            else{
                print(error?.localizedDescription ?? "Not found")
            }
        })
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

extension LoginVC : UITableViewDelegate, UITableViewDataSource, LoginDelegate {
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
            Cell.btnDelegate = self
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
extension LoginVC : GIDSignInDelegate, GIDSignInUIDelegate
{
    private func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        //UIActivityIndicatorView.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("Error\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            print("email==>\(email)")
            //googleSignInViewModel.sendSocialUserSignUpCredentialsToAPIService(user: registerObj)
        }
    }
}
