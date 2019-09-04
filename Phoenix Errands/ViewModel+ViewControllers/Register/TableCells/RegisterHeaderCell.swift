//
//  RegisterHeaderCell.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 07/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class RegisterHeaderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnFacebookAction(_ sender: Any) {
    }
    @IBAction func btnGoogleAction(_ sender: Any) {
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
