//
//  AddCardVC.swift
//  Phoenix Errands
//
//  Created by Raghav Beriwala on 22/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class AddCardVC: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func scannCardTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Profile", bundle: Bundle.main).instantiateViewController(withIdentifier: "ScannCardVC") as? ScannCardVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func btnBackTapped(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
