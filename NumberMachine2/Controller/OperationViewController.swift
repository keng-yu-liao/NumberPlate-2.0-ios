//
//  OperationViewController.swift
//  NumberMachine2
//
//  Created by liao on 2021/7/27.
//  Copyright © 2021 liao. All rights reserved.
//

import UIKit
import Alamofire

class OperationViewController: UIViewController {
    
    @IBOutlet weak var lbCurrentNum: DesignableLabel!
    @IBOutlet var imgQRcode: UIImageView!
    
    var fileName: String?
    var updateTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func updateNumber() {
//        AF.request("\(AppConfig.BASE_API_URL)\(AppConfig.REQUEST_UNCALL_NUM)", method: .get, parameters: <#T##Encodable?#>).responseJSON {
            
    }
}
