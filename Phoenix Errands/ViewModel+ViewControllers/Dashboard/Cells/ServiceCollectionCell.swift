//
//  ServiceCollectionCell.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import SDWebImage

class ServiceCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imgIconService: UIImageView!
    @IBOutlet weak var lblServiceCategoryName: UILabel!
    @IBOutlet weak var lblServiceCategoryDescription: UILabel!
    
    func intializeCellDetails(cellDic : CategoryList){
        self.lblServiceCategoryName.text = cellDic.categoryName
        self.lblServiceCategoryDescription.text = cellDic.categoryDescription
//        self.imgIconService.image = UIImage(named: "GreenCheck")!
        
        let urlMain = APIConstants.baseURL + cellDic.categoryIcon!
        self.imgIconService.sd_setImage(with: URL(string: urlMain))
    }
}
