//
//  ActivityVC.swift
//  Phoenix Errands
//
//  Created by Raghav Beriwala on 14/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import Localize_Swift

class ActivityVC: BaseViewController
{
    @IBOutlet weak var segmentController: UISegmentedControl!
    var segmentDoctorIsSelected:Bool = false
    let buttonBar = UIView()
    @IBOutlet weak var btnPeoposerMyService: UIButton!
    @IBOutlet weak var btnAskedService: UIButton!
    @IBOutlet weak var lblPublishedResult: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        headerSetup()
        CustomSegmentControl()
        setText()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    @objc func setText()
    {
        headerView.lblHeaderTitle.text = "Activity".localized();
        self.tabBarView.lblHome.textColor = UIColor.lightGray
        self.tabBarView.lblMe.textColor = UIColor.lightGray
        self.tabBarView.lblApply.textColor = UIColor.lightGray
        self.tabBarView.lblActivity.textColor = UIColor.black
        self.tabBarView.lblActivity.font = UIFont.boldSystemFont(ofSize: 14.0)
        self.tabBarView.lblContacts.textColor = UIColor.lightGray
        self.tabBarView.menuActivityImg.image = UIImage(named:"DarkActivity")
    }
    
    func CustomSegmentControl()
    {
        let font = UIFont.systemFont(ofSize: 20)
        segmentController.setTitleTextAttributes([NSAttributedString.Key.font: font],
                                                 for: .normal)
        segmentController.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor(red: 148/255.0, green: 82/255.0, blue: 0/255.0, alpha: 1.0)//UIColor.yellow
            ], for: .normal)
        
        segmentController.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.black
            ], for: .selected)
        segmentController.rounded(with: 10.0)
    }
    
    @IBAction func btnServiceTapped(_ sender: Any)
    {
        let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "DashboardVC") as? DashboardVC
        self.navigationController?.pushViewController(vc!, animated: false)
        
    }
    
    @IBAction func offerForServiceTapped(_ sender: Any)
    {
        let vc = UIStoryboard.init(name: "Apply", bundle: Bundle.main).instantiateViewController(withIdentifier: "ApplyVC") as? ApplyVC
        self.navigationController?.pushViewController(vc!, animated: false)
    }
    func headerSetup()
    {
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear
        headerView.lblHeaderTitle.text = "Activity"
        headerView.imgProfileIcon.isHidden = false
        headerView.menuButtonOutlet.isHidden = true
        headerView.imgViewMenu.isHidden = true
        headerView.menuButtonOutlet.tag = 1
        headerView.imgViewMenu.image = UIImage(named:"whiteback")
    }
}
