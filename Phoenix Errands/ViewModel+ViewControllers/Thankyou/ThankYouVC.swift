//
//  ThankYouVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class ThankYouVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.lblHeaderTitle.isHidden = true
        headerView.imgProfileIcon.isHidden = false
        headerView.imgProfileIcon.image = UIImage(named:"closebtn")
        headerView.menuButtonOutlet.isHidden = false
        headerView.notificationValueView.isHidden = true
        headerView.imgViewMenu.isHidden = false
        headerView.menuButtonOutlet.tag = 1
        headerView.imgViewMenu.isHidden = true//image = UIImage(named:"whiteback")
        tabBarView.isHidden = true
    }
    
    @IBAction func submitBtnAction(_ sender: Any) {
        
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: DashboardVC.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
}
