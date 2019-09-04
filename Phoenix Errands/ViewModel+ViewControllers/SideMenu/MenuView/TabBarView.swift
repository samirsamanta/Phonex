//
//  TabBarView.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 08/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import Localize_Swift

class TabBarView: UIView {
    
    @IBOutlet weak var menuHomeImg: UIImageView!
    @IBOutlet weak var menuContactImg: UIImageView!
    @IBOutlet weak var menuActivityImg: UIImageView!
    @IBOutlet weak var menuApplyImg: UIImageView!
    @IBOutlet weak var menuProfileImg: UIImageView!

    @IBOutlet var tabBarView: UIView!
    
    @IBOutlet weak var lblMe: UILabel!
    @IBOutlet weak var lblApply: UILabel!
    @IBOutlet weak var lblActivity: UILabel!
    @IBOutlet weak var lblContacts: UILabel!
    @IBOutlet weak var lblHome: UILabel!
    var onClickHomeButtonAction: (() -> Void)? = nil
    var onClickContactButtonAction: (() -> Void)? = nil
    var onClickMonitorButtonAction: (() -> Void)? = nil
    var onClickApplyButtonAction: (() -> Void)? = nil
    var onClickProfileButtonAction: (() -> Void)? = nil
    let availableLanguages = Localize.availableLanguages()
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }
    @objc func setText(){
//        lblHome.text = "Home".localized();
//        lblContacts.text = "Contacts".localized();
//        lblActivity.text = "Activity".localized();
//        lblApply.text = "Apply".localized();
//        lblMe.text = "Me".localized();
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
