//
//  NetworkController.swift
//  NumberMachine2
//
//  Created by liao on 2021/12/12.
//  Copyright © 2021 liao. All rights reserved.
//

import Foundation
import Alamofire

class NetworkController {
    static let STATUS_CODE = "status"
    static let DATA_CODE = "data"
    static let SUCCESS_CODE = "0000"
    static let ERROR_CODE = "9999"
    
    static func getCurrentNum(fileName: String, onSuccess: @escaping (Response) -> Void, onFail: @escaping (String) -> Void){
        let param = ["fileName" : fileName]
        var status: String = ""
        var data: String = ""
        
        AF.request("\(AppConfig.BASE_API_URL)\(AppConfig.REQUEST_UNCALL_NUM)", method: .get, parameters: param).responseJSON { response in
            switch response.result {
            case .success(let jsonObj) :
                let resObj = jsonObj as! NSDictionary
                status = resObj.object(forKey: STATUS_CODE) as! String
                if status == SUCCESS_CODE {
                    data = resObj.object(forKey: DATA_CODE) as! String
                    onSuccess(Response(status: status, data: data))
                } else {
                    data = resObj.object(forKey: DATA_CODE) as! String
                    onFail(data)
                }
            case .failure(let error):
                onFail(error.errorDescription!)
            }
        }
    }
}
