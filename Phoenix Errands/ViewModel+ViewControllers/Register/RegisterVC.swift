//
//  RegisterVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 07/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var registerTable: UITableView!
    var placeHolderArr : NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.placeHolderArr = ["First Name" , "Last Name" , "Email", "Password"]
        self.registerTable.delegate = self
        self.registerTable.dataSource = self
         self.registerTable.register(UINib(nibName: "RegisterPasswordCheckCell", bundle: Bundle.main), forCellReuseIdentifier: "RegisterPasswordCheckCell")
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnCloseAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnRegisterAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.openHomeViewController()
    }
}

extension RegisterVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (placeHolderArr?.count)! + 2
    }
    
    //"leftmenu-icon-messages.png"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "RegisterHeaderCell") as! RegisterHeaderCell
            return Cell
        case 1...4:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "RegisterFieldCell") as! RegisterFieldCell
            let name = placeHolderArr![indexPath.row - 1]
            Cell.txtField.placeholder = (name as! String)
            return Cell
        case 5:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "RegisterPasswordCheckCell") as! RegisterPasswordCheckCell
            return Cell
        default:
            return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 180
        case 1...4:
            return 75
        case 5:
            return 330
        default:
            return 0
        }
    }
}
