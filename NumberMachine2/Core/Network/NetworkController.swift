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
    
    static func login(account: String, password: String,
                    onSuccess: @escaping () -> Void, onFail: @escaping (String) -> Void) {
        let param: Parameters = [
            "account": account,
            "password": password
        ]
        
        AF.request(
            NetworkConfig.LOGIN_URL,
            method: .get,
            parameters: param
        ).responseJSON {
            reponse in
            switch reponse.result {
            case .success:
                do {
                    if reponse.data != nil {
                        let nullDataResponse = try JSONDecoder().decode(NullDataResponse.self, from: reponse.data!)
                        if nullDataResponse.statusCode == NetworkConfig.SUCCESS_CODE {
                            onSuccess()
                        } else {
                            onFail(nullDataResponse.message ?? "")
                        }
                    }
                } catch let error as NSError {
                    onFail(error.description)
                }
            case .failure(let jsonObj):
                debugPrint(jsonObj)
            }
        }
    }
    
    static func getCurrentNum(fileName: String, onSuccess: @escaping (Response) -> Void, onFail: @escaping (String) -> Void){
//        let param = ["fileName" : fileName]
//        var status: String = ""
//        var data: String = ""
//        
//        AF.request("\(AppConfig.BASE_API_URL)\(AppConfig.REQUEST_UNCALL_NUM)", method: .get, parameters: param).responseJSON { response in
//            switch response.result {
//            case .success(let jsonObj) :
//                let resObj = jsonObj as! NSDictionary
//                status = resObj.object(forKey: STATUS_CODE) as! String
//                if status == SUCCESS_CODE {
//                    data = resObj.object(forKey: DATA_CODE) as! String
//                    onSuccess(Response(status: status, data: data))
//                } else {
//                    data = resObj.object(forKey: DATA_CODE) as! String
//                    onFail(data)
//                }
//            case .failure(let error):
//                onFail(error.errorDescription!)
//            }
//        }
    }
}
