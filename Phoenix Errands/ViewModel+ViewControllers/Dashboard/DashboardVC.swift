//
//  DashboardVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 07/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import Localize_Swift

class DashboardVC: BaseViewController {

    @IBOutlet weak var lblTry: UILabel!
    @IBOutlet weak var lblTrasnport: UITextField!
    @IBOutlet weak var serviceCategoryCollection: UICollectionView!
    
    lazy var viewModel: CategoryVM = {
        return CategoryVM()
    }()
    var categoryListDetails = CategoryModel()
    var categoryArray : [CategoryList]?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear//Constants.App.statusBarColor
        headerView.lblHeaderTitle.text = "What service do you refil"
        headerView.imgProfileIcon.isHidden = false
        headerView.menuButtonOutlet.isHidden = true
        headerView.imgViewMenu.isHidden = true
        headerView.menuButtonOutlet.tag = 1
        headerView.imgViewMenu.image = UIImage(named:"whiteback")
        self.serviceCategoryCollection.delegate = self
        self.serviceCategoryCollection.dataSource = self
        setText()
    }
    
    @objc func setText()
    {
        self.tabBarView.lblHome.textColor = UIColor.black
        self.tabBarView.lblHome.font = UIFont.boldSystemFont(ofSize: 14.0)
        self.tabBarView.lblMe.textColor = UIColor.lightGray
        self.tabBarView.lblApply.textColor = UIColor.lightGray
        self.tabBarView.lblActivity.textColor = UIColor.lightGray
        self.tabBarView.lblContacts.textColor = UIColor.lightGray
        self.tabBarView.menuHomeImg.image = UIImage(named:"DarkHome")
        self.headerView.lblHeaderTitle.text = "What service do you refil".localized();
        self.lblTry.text = "Try".localized();
        self.serviceCategoryCollection.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(setText), name: NSNotification.Name( LCLLanguageChangeNotification), object: nil)
        self.initializeViewModel()
        self.getCategoryList()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func getCategoryList(){
        viewModel.getCategoryDetailsToAPIService()
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
                
                if (self?.viewModel.categoryDetails.status) == 200 {
                    self!.categoryListDetails = (self?.viewModel.categoryDetails)!
                    self!.categoryArray = (self?.viewModel.categoryDetails.categoryArray)!
                    self!.serviceCategoryCollection.reloadData()
                }else{
                    self?.showAlertWithSingleButton(title: commonAlertTitle, message: (self?.viewModel.categoryDetails.message)!, okButtonText: okText, completion: nil)
                }
            }
        }
    }
}

extension DashboardVC : UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)-> Int {
  
        if categoryArray != nil && (self.categoryArray?.count)! > 0{
            return (self.categoryArray?.count)!
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCollectionCell", for: indexPath as IndexPath) as! ServiceCollectionCell
//        cell.lblServiceCategoryName.text = "House".localized();
        cell.intializeCellDetails(cellDic: self.categoryArray![indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
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
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ServiceTypeListVC") as? ServiceTypeListVC
        vc!.categoryID = self.categoryArray![indexPath.row].id
        vc!.categoryName = self.categoryArray![indexPath.row].categoryName
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
