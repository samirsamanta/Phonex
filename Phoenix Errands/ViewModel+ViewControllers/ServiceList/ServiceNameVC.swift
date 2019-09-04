//
//  ServiceNameVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
class ServiceNameVC: BaseViewController {

    @IBOutlet weak var tableServiceNameList: UITableView!
    var subCategoryID : Int?
    var subCategoryName : String?
    
    lazy var viewModel: ServiceVM = {
        return ServiceVM()
    }()
    var serviceDetails = ServiceListModel()
    var serviceArray : [ServiceListArray]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.headerView.lblHeaderTitle.text = subCategoryName
        self.headerView.imgProfileIcon.isHidden = false
        self.headerView.menuButtonOutlet.isHidden = false
        self.headerView.imgViewMenu.isHidden = false
        self.headerView.menuButtonOutlet.tag = 1
        self.headerView.imgViewMenu.image = UIImage(named:"whiteback")
        self.tableServiceNameList.delegate = self
        self.tableServiceNameList.dataSource = self
        self.initializeViewModel()
        self.getServiceList()
    }
    
    func getServiceList(){
        
        viewModel.getServiceDetailsToAPIService(subCategoryID: String(subCategoryID!))
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
                
                if (self?.viewModel.serviceDetails.status) == 200 {
                    self!.serviceDetails = (self?.viewModel.serviceDetails)!
                    self!.serviceArray = (self?.viewModel.serviceDetails.serviceArray)!
                    self!.tableServiceNameList.reloadData()
                }else{
                    self?.showAlertWithSingleButton(title: commonAlertTitle, message: (self?.viewModel.serviceDetails.message)!, okButtonText: okText, completion: nil)
                }
            }
        }
    }
}

extension ServiceNameVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.serviceArray != nil && (self.serviceArray?.count)! > 0 {
            return (self.serviceArray?.count)!
        }else{
            return 0
        }
    }
    
    //"leftmenu-icon-messages.png"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let Cell = tableView.dequeueReusableCell(withIdentifier: "ServiceNameCell") as! ServiceNameCell
        //Cell.lblServiceNAme.text = "Interior Paint"
        Cell.initializeCellDic(cellDic : self.serviceArray![indexPath.row])
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "AskForServiceOrProvder") as? AskForServiceOrProvder
        vc!.serviceID = String(self.serviceArray![indexPath.row].id!)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
