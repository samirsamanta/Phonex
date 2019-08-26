//
//  HomeCell.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 07/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
protocol HomePageDelegate {
    func alreadyRegisterButtonAction()
    func registerWithEmailButtonAction()
}

class HomeCell: UITableViewCell {

    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

class RegisterButtonCell: UITableViewCell {
    var alreadyBtnDelegate : HomePageDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func btnRegisterAction(_ sender: Any) {
        self.alreadyBtnDelegate!.registerWithEmailButtonAction()
    }
}

class LoginButtonCell: UITableViewCell {
    
    @IBOutlet weak var lblFacebookSignIn: UILabel!
    @IBOutlet weak var lblGoogleSignIn: UILabel!
    @IBOutlet weak var lblAlreadyRegister: UILabel!
    @IBOutlet weak var lblLogIn: UILabel!
    var alreadyBtnDelegate : HomePageDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func btnAlreadyRegister(_ sender: Any) {
        self.alreadyBtnDelegate?.alreadyRegisterButtonAction()
    }
    
    @IBAction func btnFacebookAction(_ sender: Any) {
    }
    
    @IBAction func btnGoogleAction(_ sender: Any) {
    }
    
}