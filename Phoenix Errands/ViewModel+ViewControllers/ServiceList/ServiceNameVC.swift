//
//  ServiceNameVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class ServiceNameVC: BaseViewController {

    @IBOutlet weak var tableServiceNameList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.lblHeaderTitle.text = "Walls & Floors"
        headerView.imgProfileIcon.isHidden = false
        headerView.menuButtonOutlet.isHidden = false
        headerView.imgViewMenu.isHidden = false
        headerView.menuButtonOutlet.tag = 1
        headerView.imgViewMenu.image = UIImage(named:"whiteback")
        self.tableServiceNameList.delegate = self
        self.tableServiceNameList.dataSource = self
    }
}
extension ServiceNameVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //"leftmenu-icon-messages.png"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "ServiceNameCell") as! ServiceNameCell
        Cell.lblServiceNAme.text = "Interior Paint"
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "AskForServiceOrProvder") as? AskForServiceOrProvder
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
