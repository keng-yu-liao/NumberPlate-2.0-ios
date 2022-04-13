//
//  ViewController.swift
//  NumberMachine2
//
//  Created by liao on 2021/6/9.
//  Copyright © 2021 liao. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var tfLogin: UITextField!
    @IBOutlet var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapEvent = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tapEvent)
    }

    @IBAction func loginBtnClick(_ sender: Any) {
        let alertController = UIAlertController(title: "提示", message: "請輸入用戶名", preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        if (tfLogin.text == "") {
            present(alertController, animated: true, completion: nil)
        } else {
            let fileName = tfLogin.text! + ".txt"
            let param = ["fileName": fileName]
            AF.request("\(AppConfig.BASE_API_URL)\(AppConfig.CREATE_FILE)", method: .get, parameters: param).responseJSON { response in
                    switch response.result {
                        case .success(let jsonObj):
                            print(jsonObj)
                        case let .failure(error):
                            let alertController = UIAlertController(title: "提示", message: error.errorDescription, preferredStyle: UIAlertController.Style.alert)
                            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alertController, animated: true, completion: nil)
                    }
            }
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {
            return
        }
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardFrame.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

