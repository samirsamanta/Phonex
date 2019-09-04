//
//  AskForServiceOrProvder.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class AskForServiceOrProvder: BaseViewController {

    var optionArray : NSArray?
    @IBOutlet weak var tableSelectServiceOrProvide: UITableView!
    @IBOutlet weak var lblOptionName: UILabel!
    var isProvider : Bool = false
    var serviceID : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.lblHeaderTitle.text = "Looking for a provider"
        headerView.imgProfileIcon.isHidden = true
        headerView.menuButtonOutlet.isHidden = false
        headerView.notificationValueView.isHidden = true
        headerView.imgViewMenu.isHidden = false
        headerView.menuButtonOutlet.tag = 1
        headerView.imgViewMenu.image = UIImage(named:"whiteback")
        tabBarView.isHidden = true

        self.tableSelectServiceOrProvide.delegate = self
        self.tableSelectServiceOrProvide.dataSource = self
        self.optionArray = ["Yes" , "No, I am a provider, I offer my service"]
    }
}

extension AskForServiceOrProvder : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    //"leftmenu-icon-messages.png"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "AskServiceProviderCell") as! AskServiceProviderCell
        Cell.initializeCellDetails(indexPath: indexPath.row, isProvider: isProvider)
        Cell.lblOptionName.text = (optionArray![indexPath.row] as! String)
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            isProvider = false
            self.tableSelectServiceOrProvide.reloadData()
            let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "PostalCodeVC") as? PostalCodeVC
            vc!.serviceID = serviceID
            vc!.isprovider = false
            self.navigationController?.pushViewController(vc!, animated: true)
        }else{
            isProvider = true
            self.tableSelectServiceOrProvide.reloadData()
            let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProviderServiceList") as? ProviderServiceList
            vc!.serviceID = serviceID
            vc!.isprovider = true
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
