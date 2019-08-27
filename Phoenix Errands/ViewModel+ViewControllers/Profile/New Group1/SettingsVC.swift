//
//  SettingsVC.swift
//  Phoenix Errands
//
//  Created by Raghav Beriwala on 22/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    var nameArr = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ProfileCell", bundle: Bundle.main), forCellReuseIdentifier: "ProfileCell")
        nameArr = ["Change my password","Disconnect","Delete my account"]
    }
    @IBAction func btnBackTapped(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
extension SettingsVC : UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return nameArr.count
    }
    //"leftmenu-icon-messages.png"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
        Cell.lblName.text = nameArr[indexPath.row]
        if indexPath.row == 1 || indexPath.row == 2
        {
            Cell.btnDetails.isHidden = true
        }
        return Cell
    }
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("You selected cell #\(indexPath.row)!")
        switch indexPath.row {
        case 0:
            let vc = UIStoryboard.init(name: "Profile", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChangePasswordVC") as? ChangePasswordVC
            self.navigationController?.pushViewController(vc!, animated: true)
        case 1:
            let vc = UIStoryboard.init(name: "Profile", bundle: Bundle.main).instantiateViewController(withIdentifier: "WereGoingVC") as? WereGoingVC
            self.navigationController?.pushViewController(vc!, animated: true)
        case 2:
            let vc = UIStoryboard.init(name: "Profile", bundle: Bundle.main).instantiateViewController(withIdentifier: "WereGoingVC") as? WereGoingVC
            self.navigationController?.pushViewController(vc!, animated: true)
        default:
            break
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}

