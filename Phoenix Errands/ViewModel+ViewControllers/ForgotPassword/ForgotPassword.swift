//
//  ForgotPassword.swift
//  Phoenix Errands
//
//  Created by Raghav Beriwala on 05/09/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class ForgotPassword: UIView
{
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnCalcel: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        loadViewFromNib()
    }
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
        loadViewFromNib()
    }
    func loadViewFromNib()
    {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "ForgotPassword", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view);
    }
}