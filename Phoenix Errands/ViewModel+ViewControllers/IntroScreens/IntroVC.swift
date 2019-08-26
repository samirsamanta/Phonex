//
//  IntroVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 06/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class IntroVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        UIApplication.shared.statusBarView?.backgroundColor = Constants.App.statusBarColor
                print("Okay")
    }
    
    @IBAction func buttonSkip(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
