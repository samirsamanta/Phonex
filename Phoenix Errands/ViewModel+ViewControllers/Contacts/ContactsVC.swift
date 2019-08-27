//
//  ContactsVC.swift
//  Phoenix Errands
//
//  Created by Raghav Beriwala on 13/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import Localize_Swift

class ContactsVC: BaseViewController
{
    @IBOutlet weak var contactCollectionView: UICollectionView!
    @IBOutlet weak var lblDontHaveContact: UILabel!
    @IBOutlet weak var btnDiscover: UIButton!
    @IBOutlet weak var lblPhoenicOfMoment: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.contactCollectionView.delegate = self
        self.contactCollectionView.dataSource = self
        headerSetup()
        setText()
    }
    
    @IBAction func btnDiscoverTapped(_ sender: Any)
    {
        let vc = UIStoryboard.init(name: "Contacts", bundle: Bundle.main).instantiateViewController(withIdentifier: "DiscoverVC") as? DiscoverVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func headerSetup()
    {
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear
        headerView.lblHeaderTitle.text = "Contacts"
        headerView.imgProfileIcon.isHidden = false
        headerView.menuButtonOutlet.isHidden = true
        headerView.imgViewMenu.isHidden = true
        headerView.menuButtonOutlet.tag = 1
        headerView.imgViewMenu.image = UIImage(named:"whiteback")
        headerView.notificationValueView.isHidden = true
        headerView.imgProfileIcon.isHidden = true
    }
    
    @objc func setText()
    {
        lblPhoenicOfMoment.text = "Phoenix of the moment".localized();
        lblDontHaveContact.text = "You do not have any contacts yet. In the meantime, find out the current stooters.".localized();
        headerView.lblHeaderTitle.text = "Contacts".localized();
        btnDiscover.setTitle("Discover".localized(), for: UIControl.State.normal)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
}
extension ContactsVC : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)-> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactCollectionViewCell", for: indexPath as IndexPath) as! ContactCollectionViewCell
        //cell.imgContactView.
        cell.imgContactView.layer.cornerRadius = cell.imgContactView.frame.size.width/2
        cell.imgContactView.clipsToBounds = true
        cell.imgContactView.layer.borderColor = UIColor(red:17/255, green:136/255, blue:255/255, alpha: 1).cgColor
        cell.imgContactView.layer.borderWidth = 1
        return cell
    }
    
   /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = (collectionView.frame.width - (20 + 20))/2 //150
        let height: CGFloat = 170
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 10
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 10
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 20)
    }*/
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        //ContactPersonProfileVC
        let vc = UIStoryboard.init(name: "Contacts", bundle: Bundle.main).instantiateViewController(withIdentifier: "ContactPersonProfileVC") as? ContactPersonProfileVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

