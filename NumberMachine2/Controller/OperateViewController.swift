//
//  OperateViewController.swift
//  NumberMachine2
//
//  Created by liao on 2022/6/12.
//  Copyright © 2022 liao. All rights reserved.
//

import UIKit
import Alamofire

class OperateViewController: UIViewController {
    var fileName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LIAO_17")
        print(fileName ?? "")
    }
}
