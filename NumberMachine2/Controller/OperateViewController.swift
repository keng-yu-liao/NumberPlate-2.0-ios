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
        let timer = Timer.scheduledTimer(
            withTimeInterval: 2,
            repeats: true,
            block: { _ in
                self.requestWaitNum(fileName: self.fileName ?? "")
            }
        )
        timer.fire()
    }
    
    private func requestWaitNum(fileName: String) {
        NetworkController.self.requestWaitNum(
            fileName: fileName + ".txt",
            onSuccess: { data in
                print("LIAO_24")
                dump(data)
            },
            onFail: { errorMsg in
                print(errorMsg)
            }
        )
    }
    
    private func parseData(data: String) -> WaitNumData {
        let splitArr = data.components(separatedBy: "&")
        return WaitNumData (
            unCallNumStr: splitArr[0],
            lastNum: splitArr[1]
        )
    }
    
    struct WaitNumData {
        var unCallNumStr = ""
        var lastNum = ""
    }
}
