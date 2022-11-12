//
//  MoyaService.swift
//  YTMoyaWithRxDemo
//
//  Created by Ahmed Fayek on 17/04/1444 AH.
//

import Foundation
import Moya


enum MoyaService {
    case getUser(userId: String)
    case getAllUsers(page: String)
}

extension MoyaService: TargetType {
    
    var baseURL: URL {return URL(string: "https://reqres.in")!}
    
    var path: String {
        switch self {
        case .getUser(let id):
            return "/api/users/\(id)"
        case .getAllUsers(_):
            return "/api/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUser, .getAllUsers:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUser:
            return .requestPlain
        case .getAllUsers(let pageNo):
            return .requestParameters(parameters: ["page":pageNo], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getUser, .getAllUsers:
            return ["Accept":"application/json",
                    "content-type":"application/json"]
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getUser, .getAllUsers:
            return "should be filled properly".utf8Encoded
        }
    }
}

private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
