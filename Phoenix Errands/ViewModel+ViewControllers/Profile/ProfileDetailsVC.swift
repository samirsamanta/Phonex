//
//  ProfileDetailsVC.swift
//  Phoenix Errands
//
//  Created by Raghav Beriwala on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class ProfileDetailsVC: BaseViewController
{
    @IBOutlet weak var imgThumb: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imgThumb.layer.cornerRadius = imgThumb.frame.size.width/2
        imgThumb.clipsToBounds = true
        imgThumb.layer.borderColor = UIColor(red:17/255, green:136/255, blue:255/255, alpha: 1).cgColor
        imgThumb.layer.borderWidth = 1
        headerSetup()
    }
    func headerSetup()
    {
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear//Constants.App.statusBarColor
        headerView.lblHeaderTitle.text = "My profile"
        headerView.imgProfileIcon.isHidden = false
        headerView.menuButtonOutlet.isHidden = false
        headerView.imgViewMenu.isHidden = false
        headerView.menuButtonOutlet.tag = 1
        headerView.imgViewMenu.image = UIImage(named:"whiteback")
        headerView.notificationValueView.isHidden = true
        headerView.imgProfileIcon.isHidden = true
    }
}
