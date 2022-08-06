//
//  ViewController.swift
//  NumberMachine2
//
//  Created by liao on 2021/6/9.
//  Copyright © 2021 liao. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var tfLogin: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapEvent = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tapEvent)
    }

    @IBAction func loginBtnClick(_ sender: Any) {
        let alertController = UIAlertController(title: "提示", message: "請輸入用戶名與密碼", preferredStyle: UIAlertController.Style.alert)

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        if (tfLogin.text == "" || tfPassword.text == "") {
            present(alertController, animated: true, completion: nil)
        } else {
            NetworkController.self.login(
                account: tfLogin.text ?? "",
                password: tfPassword.text ?? "",
                onSuccess: {
                    self.createFile(fileName: self.tfLogin.text ?? "")
                },
                onFail: { errorMsg in
                    print(errorMsg)
                }
            )
        }
    }
    
    func createFile(fileName: String) {
        NetworkController.self.createFile(
            fileName: fileName,
            onSuccess: {
                self.performSegue(withIdentifier: "showOperationPage", sender: nil)
            },
            onFail: { errorMsg in
                print(errorMsg)
            }
        )
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       self.view.endEditing(true)
       return true
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

