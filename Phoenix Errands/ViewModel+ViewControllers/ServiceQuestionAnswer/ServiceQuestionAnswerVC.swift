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
    }
    
    @IBAction func btnCarryOnAction(_ sender: Any) {
        if cellValue == 5 {
            let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ServiceSearchVC") as? ServiceSearchVC
            self.navigationController?.pushViewController(vc!, animated: false)
        }else{
            cellValue +=  1
            switch cellValue {
            case 0:
                progressBarWidth.constant = 120
            case 1:
                progressBarWidth.constant = 180
            case 3:
                progressBarWidth.constant = 240
            case 4:
                progressBarWidth.constant = 300
            case 5:
                progressBarWidth.constant = 360
            default:
                break
            }
            UIView.transition(with: questionAnswerTable,
                              duration: 1.35,
                              options: [],
                              animations: { self.questionAnswerTable.reloadData() })
            
        }
    }
}

extension ServiceQuestionAnswerVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (optionArray?.count)!
    }
    
    //"leftmenu-icon-messages.png"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellValue {
        case 0:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "ServiceQuestionAnswerCell") as! ServiceQuestionAnswerCell
            Cell.lblQuestionName.text = (optionArray![indexPath.row] as! String)
            return Cell
        case 1:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCheckBoxCell") as! QuestionCheckBoxCell
            Cell.lblQuestionName.text = (optionArray![indexPath.row] as! String)
            return Cell
        case 2:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "ServiceQuestionAnswerCell") as! ServiceQuestionAnswerCell
            Cell.lblQuestionName.text = (optionArray![indexPath.row] as! String)
            return Cell
        case 3:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCheckBoxCell") as! QuestionCheckBoxCell
            Cell.lblQuestionName.text = (optionArray![indexPath.row] as! String)
            return Cell
        case 4:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "ServiceQuestionAnswerCell") as! ServiceQuestionAnswerCell
            Cell.lblQuestionName.text = (optionArray![indexPath.row] as! String)
            return Cell
        case 5:
            let Cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCheckBoxCell") as! QuestionCheckBoxCell
            Cell.lblQuestionName.text = (optionArray![indexPath.row] as! String)
            return Cell
        default:
            return UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
