//
//  ServiceSearchVC.swift
//  Phoenix Errands
//
//  Created by Shyam Future Tech on 09/08/19.
//  Copyright © 2019 Shyam Future Tech. All rights reserved.
//

import UIKit
import MapKit

class ServiceSearchVC: UIViewController {

    var timer : Timer?
    @IBOutlet var mapView: MKMapView!
    let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)
    override func viewDidLoad() {
        super.viewDidLoad()
        let anotation = MKPointAnnotation()
        anotation.coordinate = location
        mapView.addAnnotation(anotation)
        
        if timer == nil {
            
            timer = Timer.scheduledTimer(timeInterval: 6.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }
        
    }
    @objc func timerAction() {
        
       timer!.invalidate()
        
        let vc = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ThankYouVC") as? ThankYouVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
