//
//  AddServiceVC.swift
//  Phoenix Errands
//
//  Created by Raghav Beriwala on 19/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class AddServiceVC: BaseViewController
{
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ProfileCell", bundle: Bundle.main), forCellReuseIdentifier: "ProfileCell")
        headerSetup()
    }
    func headerSetup()
    {
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear//Constants.App.statusBarColor
        headerView.lblHeaderTitle.text = "My Service"
        headerView.imgProfileIcon.isHidden = false
        headerView.menuButtonOutlet.isHidden = false
        headerView.imgViewMenu.isHidden = false
        headerView.menuButtonOutlet.tag = 1
        headerView.imgViewMenu.image = UIImage(named:"whiteback")
        headerView.notificationValueView.isHidden = true
        headerView.imgProfileIcon.isHidden = true
    }
}
extension AddServiceVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    //"leftmenu-icon-messages.png"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
        
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}

