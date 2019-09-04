//
//  ServiceQuestionAnswerVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class ServiceQuestionAnswerVC: BaseViewController {

    @IBOutlet weak var progressBarWidth: NSLayoutConstraint!
    @IBOutlet weak var questionAnswerTable: UITableView!
    var optionArray : NSArray?
    var cellValue : Int = 0
    var serviceID : String?
    var isprovider : Bool?
    
    lazy var viewModel: QuestionAnswerVM = {
        return QuestionAnswerVM()
    }()
    
    var setDetails = QuestionAnswerModel()
    var questionSetUserArr : [QuestionAnswerUserList]?
    var questionSetProviderArr : [QuestionAnswerProviderList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.lblHeaderTitle.text = "What is your project"
        headerView.imgProfileIcon.isHidden = true
        headerView.menuButtonOutlet.isHidden = false
        headerView.notificationValueView.isHidden = true
        headerView.imgViewMenu.isHidden = false
        headerView.menuButtonOutlet.tag = 1
        headerView.imgViewMenu.image = UIImage(named:"whiteback")
        tabBarView.isHidden = true
        self.questionAnswerTable.delegate = self
        self.questionAnswerTable.dataSource = self
        self.optionArray = ["I want to find a provider quickly" , "I'm looking for quotes for a service that will take place later", "I'm testing Stootie to understand how it works"]
        self.questionAnswerTable.register(UINib(nibName: "QuestionCheckBoxCell", bundle: Bundle.main), forCellReuseIdentifier: "QuestionCheckBoxCell")
        self.initializeViewModel()
        self.getQuestionSetDetails()
    }
    
    func getQuestionSetDetails(){
        viewModel.getQuestionSetDetailsToAPIService(serviceID: serviceID!)
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
                
                if (self?.viewModel.questionSetDetails.status) == 200 {
                    self!.setDetails = (self?.viewModel.questionSetDetails)!
                    self!.questionSetUserArr = (self?.viewModel.questionSetDetails.questionSetUserArr)!
                    self!.questionSetProviderArr = (self?.viewModel.questionSetDetails.questionSetProviderArr)!
                    self!.questionAnswerTable.reloadData()
                }else{
                    self?.showAlertWithSingleButton(title: commonAlertTitle, message: (self?.viewModel.questionSetDetails.message)!, okButtonText: okText, completion: nil)
                }
            }
        }
    }
    
    
    @IBAction func btnCarryOnAction(_ sender: Any) {

        if isprovider == true {
            if questionSetProviderArr != nil  && (questionSetProviderArr?.count)! > cellValue {
                cellValue +=  1
                progressBarWidth.constant += 60
                UIView.transition(with: questionAnswerTable,
                                  duration: 1.35,
                                  options: [],
                                  animations: { self.questionAnswerTable.reloadData() })
            }else{
                let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ServiceSearchVC") as? ServiceSearchVC
                self.navigationController?.pushViewController(vc!, animated: false)
            }
        }else{
            if questionSetUserArr != nil  && (questionSetUserArr?.count)! > cellValue {
                cellValue +=  1
                progressBarWidth.constant += 60
                UIView.transition(with: questionAnswerTable,
                                  duration: 1.35,
                                  options: [],
                                  animations: { self.questionAnswerTable.reloadData() })
            }else{
                let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ServiceSearchVC") as? ServiceSearchVC
                self.navigationController?.pushViewController(vc!, animated: false)
            }
        }
    }
}

extension ServiceQuestionAnswerVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isprovider == true {
            if questionSetProviderArr != nil  && (questionSetProviderArr?.count)! > cellValue {
                let count = questionSetProviderArr![cellValue].array_answer
                let array = count!.components(separatedBy: ",")
                if array.count > 0 {
                    return (array.count)
                }else{
                    return 0
                }
            }else{
                return 0
            }
            
        }else{
            if questionSetUserArr != nil  && (questionSetUserArr?.count)! > cellValue {
                let count = questionSetUserArr![cellValue].array_answer
                let array = count!.components(separatedBy: ",")
                if array.count > 0 {
                    return (array.count)
                }else{
                    return 0
                }
            }else{
                return 0
            }
        }
        
    }
    
    //"leftmenu-icon-messages.png"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isprovider == true {
            let data = questionSetProviderArr![cellValue].array_answer
            let array = data!.components(separatedBy: ",")
            if questionSetProviderArr![cellValue].type == "text" {
                let Cell = tableView.dequeueReusableCell(withIdentifier: "ServiceQuestionAnswerCell") as! ServiceQuestionAnswerCell
                Cell.lblQuestionName.text = array[indexPath.row]
                return Cell
            }else if questionSetProviderArr![cellValue].type == "checkbox" {
                let Cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCheckBoxCell") as! QuestionCheckBoxCell
                Cell.lblQuestionName.text = array[indexPath.row]
                return Cell
            }else if questionSetProviderArr![cellValue].type == "radio" {
                
                let Cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCheckBoxCell") as! QuestionCheckBoxCell
                Cell.lblQuestionName.text = array[indexPath.row]
                return Cell
                
            }else{
                return UITableViewCell(style: .value1, reuseIdentifier: "Cell")
            }
        }else{
            let data = questionSetUserArr![cellValue].array_answer
            let array = data!.components(separatedBy: ",")
            if questionSetUserArr![cellValue].type == "radio" {
                let Cell = tableView.dequeueReusableCell(withIdentifier: "ServiceQuestionAnswerCell") as! ServiceQuestionAnswerCell
                Cell.lblQuestionName.text = array[indexPath.row]
                return Cell
            }else if questionSetUserArr![cellValue].type == "checkbox" {
                let Cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCheckBoxCell") as! QuestionCheckBoxCell
                Cell.lblQuestionName.text = array[indexPath.row]
                return Cell
            }else if questionSetUserArr![cellValue].type == "text" {
                
                let Cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCheckBoxCell") as! QuestionCheckBoxCell
                Cell.lblQuestionName.text = array[indexPath.row]
                return Cell
                
            }else{
                return UITableViewCell(style: .value1, reuseIdentifier: "Cell")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
