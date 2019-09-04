//
//  LoginHeaderCell.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 07/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class LoginHeaderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func btnFacebookAction(_ sender: Any) {
        
    }
    
    @IBAction func btnGoogleAction(_ sender: Any) {
        
    }
}

class LoginEmailPasswordCell: UITableViewCell {
    
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func initializeCellObject(cellDic : UserModel){
        self.txtFieldEmail.text = cellDic.userName
         self.txtFieldPassword.text = cellDic.userPassword
    }
    
    @IBAction func buttonForgotPasswordAction(_ sender: Any) {
        
    }
}
