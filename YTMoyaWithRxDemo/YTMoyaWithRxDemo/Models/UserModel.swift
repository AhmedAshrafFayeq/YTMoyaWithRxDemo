//
//  User.swift
//  YTMoyaWithRxDemo
//
//  Created by Ahmed Fayek on 18/04/1444 AH.
//

import Foundation

// MARK: - UserResponse
struct UserResponse: Codable {
    let data: User
}

// MARK: - User
struct User: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
