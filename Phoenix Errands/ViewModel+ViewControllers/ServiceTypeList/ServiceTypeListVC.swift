//
//  ServiceTypeListVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class ServiceTypeListVC: BaseViewController {

    @IBOutlet weak var tableServiceTypeList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.tableServiceTypeList.delegate = self
        self.tableServiceTypeList.dataSource = self
        
        headerView.lblHeaderTitle.text = "House"
        headerView.imgProfileIcon.isHidden = false
        headerView.menuButtonOutlet.isHidden = false
        headerView.imgViewMenu.isHidden = false
        headerView.menuButtonOutlet.tag = 1
        headerView.imgViewMenu.image = UIImage(named:"whiteback")
    }
}

extension ServiceTypeListVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //"leftmenu-icon-messages.png"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTypeListCell") as! ServiceTypeListCell
        Cell.lblServiceTypeName.text = "Walls & Floors"
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ServiceNameVC") as? ServiceNameVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
