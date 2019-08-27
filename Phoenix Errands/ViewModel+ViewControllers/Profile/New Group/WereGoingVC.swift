//
//  WereGoingVC.swift
//  Phoenix Errands
//
//  Created by Raghav Beriwala on 22/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class WereGoingVC: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func btnBackTapped(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
