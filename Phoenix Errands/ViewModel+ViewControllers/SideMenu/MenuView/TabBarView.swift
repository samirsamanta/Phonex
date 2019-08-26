//
//  TabBarView.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 08/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class TabBarView: UIView {

    @IBOutlet var tabBarView: UIView!
    
    var onClickHomeButtonAction: (() -> Void)? = nil
    var onClickContactButtonAction: (() -> Void)? = nil
    var onClickMonitorButtonAction: (() -> Void)? = nil
    var onClickApplyButtonAction: (() -> Void)? = nil
    var onClickProfileButtonAction: (() -> Void)? = nil
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("TabBarView", owner: self, options: nil)
        addSubview(tabBarView)
        tabBarView.frame = self.bounds
        tabBarView.autoresizingMask = .flexibleHeight
    }
    
    
    @IBAction func btnHomeAction(_ sender: Any) {
        if self.onClickHomeButtonAction != nil{
            self.onClickHomeButtonAction!()
        }
    }
    
    @IBAction func btnContactAction(_ sender: Any) {
        if self.onClickContactButtonAction != nil{
            self.onClickContactButtonAction!()
        }
    }
    @IBAction func btnMonitorAction(_ sender: Any) {
        if self.onClickMonitorButtonAction != nil{
            self.onClickMonitorButtonAction!()
        }
    }
    
    @IBAction func btnApplyAction(_ sender: Any) {
        if self.onClickApplyButtonAction != nil{
            self.onClickApplyButtonAction!()
        }
    }
    
    @IBAction func btnProfileAction(_ sender: Any) {
        if self.onClickProfileButtonAction != nil{
            self.onClickProfileButtonAction!()
        }
    }
}
