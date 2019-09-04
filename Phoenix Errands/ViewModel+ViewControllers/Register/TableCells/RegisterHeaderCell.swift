//
//  RegisterHeaderCell.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 07/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

protocol RegisterDelegate
{
    func registerWithGmailAction()
    func registerWithFaceBookAction()
}

class RegisterHeaderCell: UITableViewCell
{
    var btnDelegate : RegisterDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnFacebookAction(_ sender: Any)
    {
        self.btnDelegate?.registerWithFaceBookAction()
    }
    @IBAction func btnGoogleAction(_ sender: Any)
    {
        self.btnDelegate?.registerWithGmailAction()
    }
}

class RegisterFieldCell: UITableViewCell {
    
    @IBOutlet weak var txtField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initializeCell(cellDic : UserRegister , indexPath : Int){
        switch indexPath {
        case 1:
            txtField.text = cellDic.userFirstName
        case 2:
            txtField.text = cellDic.userLastName
        case 3:
            txtField.text = cellDic.userEmail
        case 4:
            txtField.text = cellDic.userpassword
        default:
            break
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
