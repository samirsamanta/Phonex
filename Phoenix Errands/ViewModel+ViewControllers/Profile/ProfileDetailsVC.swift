//
//  ProfileDetailsVC.swift
//  Phoenix Errands
//
//  Created by Raghav Beriwala on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import Localize_Swift

class ProfileDetailsVC: BaseViewController
{
    @IBOutlet weak var imgThumb: UIImageView!
    
    @IBOutlet weak var lblOneHour: UILabel!
    @IBOutlet weak var lblResponseTime: UILabel!
    @IBOutlet weak var lblMyStatistics: UILabel!
    @IBOutlet weak var lblSoldItems: UILabel!
    @IBOutlet weak var lblServicessProvided: UILabel!
    @IBOutlet weak var lblMissionsCarriedout: UILabel!
    @IBOutlet weak var lblActivity: UILabel!
    @IBOutlet weak var lblParticular: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblVarification: UILabel!
    @IBOutlet weak var lblNew: UILabel!
    @IBOutlet weak var btnLanguage: UIButton!
    
    var actionSheet: UIAlertController!
    let availableLanguages = Localize.availableLanguages()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imgThumb.layer.cornerRadius = imgThumb.frame.size.width/2
        imgThumb.clipsToBounds = true
        imgThumb.layer.borderColor = UIColor(red:17/255, green:136/255, blue:255/255, alpha: 1).cgColor
        imgThumb.layer.borderWidth = 1
        headerSetup()
        self.setText()
    }
    @objc func setText()
    {
        lblNew.text = "New".localized();
        lblVarification.text = "Varifications".localized();
        lblStatus.text = "Status".localized();
        lblParticular.text = "Particular".localized();
        lblActivity.text = "My activity".localized();
        lblMissionsCarriedout.text = "Missions carried out".localized();
        lblServicessProvided.text = "Services provided".localized();
        lblSoldItems.text = "Sold items".localized();
        lblMyStatistics.text = "My statistics".localized();
        lblResponseTime.text = "Response time".localized();
        headerView.lblHeaderTitle.text = "My profile".localized();
        btnLanguage.setTitle("Language".localized(), for: UIControl.State.normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func changeLanguageTapped(_ sender: Any)
    {
        actionSheet = UIAlertController(title: nil, message: "Switch Language".localized(), preferredStyle: UIAlertController.Style.actionSheet)
        for language in availableLanguages {
            let displayName = Localize.displayNameForLanguage(language)
            let languageAction = UIAlertAction(title: displayName, style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                print("language==>\(language)")
                Localize.setCurrentLanguage(language)
            })
            actionSheet.addAction(languageAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel".localized(), style: UIAlertAction.Style.cancel, handler: {
            (alert: UIAlertAction) -> Void in
        })
        actionSheet.addAction(cancelAction)
        self.present(actionSheet, animated: true, completion: nil)
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
