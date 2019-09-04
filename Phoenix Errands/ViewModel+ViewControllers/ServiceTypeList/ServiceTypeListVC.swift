//
//  ServiceTypeListVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class ServiceTypeListVC: BaseViewController {

    @IBOutlet weak var tableServiceTypeList: UITableView!
    var categoryID : Int?
    var categoryName : String?
    lazy var viewModel: SubCategoryVM = {
        return SubCategoryVM()
    }()
    var subCategoryListDetails = SubCategoryModel()
    var subCategoryArray : [SubCategoryList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableServiceTypeList.delegate = self
        self.tableServiceTypeList.dataSource = self
        self.headerView.lblHeaderTitle.text = categoryName
        self.headerView.imgProfileIcon.isHidden = false
        self.headerView.menuButtonOutlet.isHidden = false
        self.headerView.imgViewMenu.isHidden = false
        self.headerView.menuButtonOutlet.tag = 1
        self.headerView.imgViewMenu.image = UIImage(named:"whiteback")
        self.initializeViewModel()
        self.getSubCetgoryList()
    }
    
    func getSubCetgoryList(){
        viewModel.getSubCategoryDetailsToAPIService(categoryID: String(categoryID!))
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
                
                if (self?.viewModel.subCategoryDetails.status) == 200 {
                    self!.subCategoryListDetails = (self?.viewModel.subCategoryDetails)!
                    self!.subCategoryArray = (self?.viewModel.subCategoryDetails.subCategoryArray)!
                    self!.tableServiceTypeList.reloadData()
                }else{
                    self?.showAlertWithSingleButton(title: commonAlertTitle, message: (self?.viewModel.subCategoryDetails.message)!, okButtonText: okText, completion: nil)
                }
            }
        }
    }
}

extension ServiceTypeListVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if subCategoryArray != nil && (self.subCategoryArray?.count)! > 0{
            return (self.subCategoryArray?.count)!
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "ServiceTypeListCell") as! ServiceTypeListCell
        //Cell.lblServiceTypeName.text = "Walls & Floors"
        Cell.initializeCellDetails(cellDic : self.subCategoryArray![indexPath.row])
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ServiceNameVC") as? ServiceNameVC
        vc!.subCategoryName = self.subCategoryArray![indexPath.row].subcategoryName
        vc!.subCategoryID = self.subCategoryArray![indexPath.row].id
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
