//
//  NetworkConfig.swift
//  NumberMachine2
//
//  Created by liao on 2022/4/30.
//  Copyright © 2022 liao. All rights reserved.
//

import Foundation

class NetworkConfig {
    static let BASE_API_URL = "http://35.206.216.134/dev-2.1/api/"
    static let SUCCESS_CODE = "0000"
    static let FAIL_CODE = "9999"
    
    static let LOGIN_FAIL_CODE = "E0001"
    
    static let LOGIN_URL = "\(BASE_API_URL)login.php"
    static let CREATE_FILE = "\(BASE_API_URL)createFile.php"
    static let REQUEST_WAIT_NUM = "\(BASE_API_URL)requestUncallNum.php"
}

struct NullDataResponse : Decodable {
    var statusCode: String
    var message: String? = nil
}
