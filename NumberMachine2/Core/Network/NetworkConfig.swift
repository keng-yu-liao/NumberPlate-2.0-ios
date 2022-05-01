//
//  NetworkConfig.swift
//  NumberMachine2
//
//  Created by liao on 2022/4/30.
//  Copyright © 2022 liao. All rights reserved.
//

import Foundation

class NetworkConfig {
    static let BASE_API_URL = "http://35.206.216.134/dev-2.0/"
    static let SUCCESS_CODE = "0000"
    static let FAIL_CODE = "9999"
    
    static let LOGIN_FAIL_CODE = "E0001"
    
    static let LOGIN_URL = "\(BASE_API_URL)Login.php"
}

struct NullDataResponse : Decodable {
    var statusCode: String
    var message: String? = nil
}
