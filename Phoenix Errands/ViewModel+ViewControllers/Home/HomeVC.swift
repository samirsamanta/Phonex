//
//  HomeVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 07/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
//EEF3F7
class HomeVC: UIViewController {

    @IBOutlet weak var formTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.formTableView.delegate = self
        self.formTableView.dataSource = self
    }
    
    @IBAction func btnCloseAction(_ sender: Any) {
        
    }
    func registerWithEmailButtonAction(){
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegisterVC") as? RegisterVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func alreadyRegisterButtonAction(){
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
extension HomeVC : UITableViewDelegate, UITableViewDataSource,HomePageDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //"leftmenu-icon-messages.png"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
            return Cell
        case 1:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "RegisterButtonCell") as! RegisterButtonCell
            Cell.alreadyBtnDelegate = self
            return Cell
        case 2:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "LoginButtonCell") as! LoginButtonCell
            Cell.alreadyBtnDelegate = self
            return Cell
        default:
            return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 150
        case 1:
            return 150
        case 2:
            return 222
        default:
            return 0
        }
    }
}
