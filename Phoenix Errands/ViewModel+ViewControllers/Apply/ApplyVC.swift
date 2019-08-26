//
//  ApplyVC.swift
//  Phoenix Errands
//
//  Created by Raghav Beriwala on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class ApplyVC: BaseViewController
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtSectionDropdown: IQDropDownTextField!
    
    var nameArr = [String]()
    var serviceArr = [String]()
    var btntextArr = [String]()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ApplyCell", bundle: Bundle.main), forCellReuseIdentifier: "ApplyCell")
        
        nameArr = ["Mathieu H.","Marle A.","Zachaeie D."]
        serviceArr = ["Man's hairstyle.","Household.","Zachaeie D."]
        btntextArr = ["New","Full","Rest place"]
        setDropDown()
        headerSetup()
    }
    func headerSetup()
    {
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear//Constants.App.statusBarColor
        headerView.lblHeaderTitle.text = "Apply"
        headerView.imgProfileIcon.isHidden = false
        headerView.menuButtonOutlet.isHidden = true
        headerView.imgViewMenu.isHidden = true
        headerView.menuButtonOutlet.tag = 1
        headerView.imgViewMenu.image = UIImage(named:"whiteback")
        //self.serviceCategoryCollection.delegate = self
        //self.serviceCategoryCollection.dataSource = self
    }
    func setDropDown()
    {
        var ServiceLists = [NSString]()
        ServiceLists.append("Service A")
        ServiceLists.append("Service B")
        ServiceLists.append("Service C")
        //txtSectionDropdown.itemList = ServiceLists
        //txtSectionDropdown.text! = ServiceLists[0] as String
    }
    @IBAction func mySkillTapped(_ sender: Any)
    {
        let vc = UIStoryboard.init(name: "Request", bundle: Bundle.main).instantiateViewController(withIdentifier: "RequestVC") as? RequestVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

extension ApplyVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    //"leftmenu-icon-messages.png"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "ApplyCell") as! ApplyCell
        Cell.lblName.text = nameArr[indexPath.row]
        Cell.lblService.text = serviceArr[indexPath.row]
        Cell.yellowBtntext.text = btntextArr[indexPath.row]
        
        return Cell
    }
    
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("You selected cell #\(indexPath.row)!")
        switch indexPath.row {
        case 0:
            let vc = UIStoryboard.init(name: "Request", bundle: Bundle.main).instantiateViewController(withIdentifier: "NewRequestDetailsVC") as? NewRequestDetailsVC
            self.navigationController?.pushViewController(vc!, animated: true)
        case 1://RequestDetailsVC
            let vc = UIStoryboard.init(name: "Request", bundle: Bundle.main).instantiateViewController(withIdentifier: "RequestVC") as? RequestVC
            self.navigationController?.pushViewController(vc!, animated: true)
        case 2:
            let vc = UIStoryboard.init(name: "Request", bundle: Bundle.main).instantiateViewController(withIdentifier: "RequestDetailsVC") as? RequestDetailsVC
            self.navigationController?.pushViewController(vc!, animated: true)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}