//
//  ContactPersonProfileVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 13/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class ContactPersonProfileVC: BaseViewController
{

    @IBOutlet weak var imgThumb: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        headerSetup()
        imgThumb.layer.cornerRadius = imgThumb.frame.size.width/2
        imgThumb.clipsToBounds = true
        imgThumb.layer.borderColor = UIColor(red:17/255, green:136/255, blue:255/255, alpha: 1).cgColor
        imgThumb.layer.borderWidth = 1
    }
    @IBAction func btnAskforServicetapped(_ sender: Any)
    {
        let vc = UIStoryboard.init(name: "Contacts", bundle: Bundle.main).instantiateViewController(withIdentifier: "AskForServiceVC") as? AskForServiceVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func headerSetup()
    {
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear
        headerView.lblHeaderTitle.text = "Profile"
        headerView.imgProfileIcon.isHidden = false
        headerView.menuButtonOutlet.isHidden = false
        headerView.imgViewMenu.isHidden = false
        headerView.menuButtonOutlet.tag = 1
        headerView.imgViewMenu.image = UIImage(named:"whiteback")
        headerView.notificationValueView.isHidden = true
        headerView.imgProfileIcon.isHidden = true
    }
    
}
