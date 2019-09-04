//
//  ProviderServiceList.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class ProviderServiceList: BaseViewController {

    @IBOutlet weak var providerServiceListCollectionView: UICollectionView!
    var serviceNameArray : NSArray?
    var serviceID : String?
    var isprovider : Bool?
    lazy var viewModel: ProviderSkillVM = {
        return ProviderSkillVM()
    }()
    var skillDetails = SkillListModel()
    var skillListArray : [SkillListListModel]?
    var skillValidateString : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headerView.lblHeaderTitle.text = "Skills"
        self.headerView.imgProfileIcon.isHidden = true
        self.headerView.menuButtonOutlet.isHidden = false
        self.headerView.notificationValueView.isHidden = true
        self.headerView.imgViewMenu.isHidden = false
        self.headerView.menuButtonOutlet.tag = 1
        self.headerView.imgViewMenu.image = UIImage(named:"whiteback")
        self.tabBarView.isHidden = true
        self.providerServiceListCollectionView.delegate = self
        self.providerServiceListCollectionView.dataSource = self
        self.serviceNameArray = ["Mover","Housekeeper","Plumber","heating engineer"]
        self.initializeViewModel()
        self.getSkillListDetails()
    }
    
    func getSkillListDetails(){
        viewModel.getSkillDetailsToAPIService()
    }
    
    @IBAction func btnValidateAction(_ sender: Any) {
        
        for obj in skillListArray! {
            if obj.isSelected == true{
                let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "PostalCodeVC") as? PostalCodeVC
                vc!.isprovider = isprovider
                vc!.serviceID = serviceID
                self.navigationController?.pushViewController(vc!, animated: true)
                break
            }
        }
        
//        if skillValidateString != nil {
//            let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "PostalCodeVC") as? PostalCodeVC
//            self.navigationController?.pushViewController(vc!, animated: true)
//        }else{
//            self.showAlertWithSingleButton(title: commonAlertTitle, message: "Please select at least one skill", okButtonText: okText, completion: nil)
//        }
    }
    
    func initializeViewModel() {
        
        viewModel.showAlertClosure = {[weak self]() in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    self?.showAlertWithSingleButton(title: commonAlertTitle, message: message, okButtonText: okText, completion: nil)
                }
            }
        }
        
        viewModel.updateLoadingStatus = {[weak self]() in
            DispatchQueue.main.async {
                
                let isLoading = self?.viewModel.isLoading ?? false
                if isLoading {
                    self?.addLoaderView()
                } else {
                    self?.removeLoaderView()
                }
            }
        }
        
        viewModel.refreshViewClosure = {[weak self]() in
            DispatchQueue.main.async {
                
                if (self?.viewModel.skillDetails.status) == 200 {
                    self!.skillDetails = (self?.viewModel.skillDetails)!
                    self!.skillListArray = (self?.viewModel.skillDetails.skillListArray)!
                    self!.providerServiceListCollectionView.reloadData()
                }else{
                    self?.showAlertWithSingleButton(title: commonAlertTitle, message: (self?.viewModel.skillDetails.message)!, okButtonText: okText, completion: nil)
                }
            }
        }
    }
}

extension ProviderServiceList : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)-> Int {
        
        if skillListArray != nil && (skillListArray?.count)! > 0 {
            return (skillListArray?.count)!
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProviderServiceCell", for: indexPath as IndexPath) as! ProviderServiceCell
        cell.initializeCellDetails(cellDic: skillListArray![indexPath.row])
//        cell.lbServiceName.text = (serviceNameArray![indexPath.row] as! String)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = (collectionView.frame.width - (20 + 20))/2
        let height: CGFloat = 150
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
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let isSected = skillListArray![indexPath.row].isSelected
        if isSected == false {
            skillListArray![indexPath.row].isSelected = true
        }else{
            skillListArray![indexPath.row].isSelected = false
        }
        self.providerServiceListCollectionView.reloadData()
    }
}
