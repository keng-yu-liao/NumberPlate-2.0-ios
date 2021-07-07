//
//  ViewController.swift
//  NumberMachine2
//
//  Created by liao on 2021/6/9.
//  Copyright © 2021 liao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tfLogin: UITextField!
    @IBOutlet var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtnClick(_ sender: Any) {
        let alertController = UIAlertController(title: "提示", message: "請輸入用戶名", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        if (tfLogin.text == "") {
            present(alertController, animated: true, completion: nil)
        }
    }
}

