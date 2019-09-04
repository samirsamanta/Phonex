//
//  ProfileVc.swift
//  Phoenix Errands
//
//  Created by Raghav Beriwala on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import Localize_Swift

class ProfileVc: BaseViewController
{
    @IBOutlet weak var imgthumb: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblNew: UILabel!
    @IBOutlet weak var lblAddMyService: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ProfileCell", bundle: Bundle.main), forCellReuseIdentifier: "ProfileCell")
        imgthumb.layer.cornerRadius = imgthumb.frame.size.width/2
        imgthumb.clipsToBounds = true
        imgthumb.layer.borderColor = UIColor(red:17/255, green:136/255, blue:255/255, alpha: 1).cgColor
        imgthumb.layer.borderWidth = 1
        headerSetup()
        setText()
    }
    
    @IBAction func btnAddServices(_ sender: Any)
    {
        let vc = UIStoryboard.init(name: "Profile", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddServiceVC") as? AddServiceVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func headerSetup()
    {
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear//Constants.App.statusBarColor
        headerView.lblHeaderTitle.text = "My profile"
        headerView.imgProfileIcon.isHidden = false
        headerView.menuButtonOutlet.isHidden = true
        headerView.imgViewMenu.isHidden = true
        headerView.menuButtonOutlet.tag = 1
        headerView.imgViewMenu.image = UIImage(named:"whiteback")
        headerView.notificationValueView.isHidden = true
        headerView.imgProfileIcon.isHidden = true
    }
    
    @objc func setText()
    {
        self.tabBarView.lblHome.textColor = UIColor.lightGray
        self.tabBarView.lblMe.textColor = UIColor.black
        self.tabBarView.lblApply.textColor = UIColor.lightGray
        self.tabBarView.lblActivity.textColor = UIColor.lightGray
        self.tabBarView.lblContacts.textColor = UIColor.lightGray
        self.tabBarView.lblMe.font = UIFont.boldSystemFont(ofSize: 14.0)
        self.tabBarView.menuProfileImg.image = UIImage(named:"DarkProfile")
        lblNew.text = "New".localized();
        lblAddMyService.text = "Add my services".localized();
        headerView.lblHeaderTitle.text = "My profile".localized();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func btnProfiledetailsTapped(_ sender: Any)
    {
        let vc = UIStoryboard.init(name: "Profile", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProfileDetailsVC") as? ProfileDetailsVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension ProfileVc : UITableViewDelegate, UITableViewDataSource {
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
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("You selected cell #\(indexPath.row)!")
        switch indexPath.row {
        case 0:
            let vc = UIStoryboard.init(name: "Profile", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddPaymentVC") as? AddPaymentVC
            self.navigationController?.pushViewController(vc!, animated: true)
        case 1:
            let vc = UIStoryboard.init(name: "Profile", bundle: Bundle.main).instantiateViewController(withIdentifier: "WereGoingVC") as? WereGoingVC
            self.navigationController?.pushViewController(vc!, animated: true)
        case 2:
            let vc = UIStoryboard.init(name: "Profile", bundle: Bundle.main).instantiateViewController(withIdentifier: "SettingsVC") as? SettingsVC
            self.navigationController?.pushViewController(vc!, animated: true)
        default:
            break
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}
