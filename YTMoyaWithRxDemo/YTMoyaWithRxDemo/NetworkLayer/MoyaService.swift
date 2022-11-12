//
//  MoyaService.swift
//  YTMoyaWithRxDemo
//
//  Created by Ahmed Fayek on 17/04/1444 AH.
//

import Foundation
import Moya

enum MoyaService: TargetType {
    
    case getUser(userId: String)
    
    var baseURL: URL {return URL(string: "https://reqres.in")!}
    
    var path: String {
        switch self {
        case .getUser(let id):
            return "/api/user/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUser:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUser:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getUser:
            return ["Accept":"application/json",
                    "content-type":"application/json"]
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getUser:
            return "should be filled properly".utf8Encoded
        }
    }
}

private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
