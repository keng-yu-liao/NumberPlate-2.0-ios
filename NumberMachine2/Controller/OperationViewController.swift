//
//  OperationViewController.swift
//  NumberMachine2
//
//  Created by liao on 2021/7/27.
//  Copyright © 2021 liao. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class OperationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lbCurrentNum: DesignableLabel!
    @IBOutlet var imgQRcode: UIImageView!
    @IBOutlet weak var numberTableView: UITableView!
    
    var fileName: String?
    var updateTimer: Timer?
    var numArr: Array<String> = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numArr.count / 6 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:WaitNumTableViewCell.self), for: indexPath) as! WaitNumTableViewCell
        
        if (numArr.count > indexPath.row * 5) {
            cell.firstLabel.alpha = 1
            cell.firstLabel.text = numArr[indexPath.row * 5]
        } else {
            cell.firstLabel.alpha = 0
        }
        
        if (numArr.count > indexPath.row * 5 + 1) {
            cell.secondLabel.alpha = 1
            cell.secondLabel.text = numArr[indexPath.row * 5 + 1]
        } else {
            cell.secondLabel.alpha = 0
        }
        
        if (numArr.count > indexPath.row * 5 + 2) {
            cell.thirdLabel.alpha = 1
            cell.thirdLabel.text = numArr[indexPath.row * 5 + 2]
        } else {
            cell.thirdLabel.alpha = 0
        }
        
        if (numArr.count > indexPath.row * 5 + 3) {
            cell.forthLabel.alpha = 1
            cell.forthLabel.text = numArr[indexPath.row * 5 + 3]
        } else {
            cell.forthLabel.alpha = 0
        }
        
        if (numArr.count > indexPath.row * 5 + 4) {
            cell.fifthLabel.alpha = 1
            cell.fifthLabel.text = numArr[indexPath.row * 5 + 4]
        } else {
            cell.fifthLabel.alpha = 0
        }
        
        cell.onButtonTapped = {
            var aa = "asd"
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        cell.firstLabel.isUserInteractionEnabled = true
        cell.firstLabel.addGestureRecognizer(tap)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumber(fileName: fileName!)
        self.numberTableView.backgroundColor = UIColor(named: "customYellow")
    }

    func updateNumber(fileName: String) {
        NetworkController.getCurrentNum(
            fileName: fileName,
            onSuccess: { response in
                self.numArr = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
                self.numberTableView.reloadData()
            },
            onFail: { response in
                print(response.data)
            }
        )
    }
    
    @objc
    func tapFunction(sender: UITapGestureRecognizer) {
        print("aaa")
    }
}
