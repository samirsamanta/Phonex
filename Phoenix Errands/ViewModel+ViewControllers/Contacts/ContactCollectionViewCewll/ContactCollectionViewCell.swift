//
//  ContactCollectionViewCell.swift
//  Phoenix Errands
//
//  Created by Raghav Beriwala on 13/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit

class ContactCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var imgContactView: UIImageView!
    @IBOutlet weak var lblContactName: UILabel!
    
    func initializeCellDetails(cellDic : ContactList){
        lblContactName.text = cellDic.contactName
    }
}
