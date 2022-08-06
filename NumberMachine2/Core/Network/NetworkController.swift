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
    
    static func createFile(
        fileName: String,
        onSuccess: @escaping () -> Void,
        onFail: @escaping (String) -> Void
    ) {
        let param: Parameters = [
            "fileName": fileName
        ]
        
        AF.request(
            NetworkConfig.CREATE_FILE,
            method: .get,
            parameters: param
        ).responseJSON {
            response in
            switch response.result {
            case .success:
                do {
                    if response.data != nil {
                        let nullDataResponse = try JSONDecoder().decode(NullDataResponse.self, from: response.data!)
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
}
