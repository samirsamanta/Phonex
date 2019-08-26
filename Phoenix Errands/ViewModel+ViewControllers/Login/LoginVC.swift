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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginTableView.delegate = self
        self.loginTableView.dataSource = self
    }
    
    @IBAction func btnCloseAction(_ sender: Any) {
        
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonLoginSubmitAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.openHomeViewController()
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
