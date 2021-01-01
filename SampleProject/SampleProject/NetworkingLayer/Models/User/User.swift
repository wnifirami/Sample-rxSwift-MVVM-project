//
//  User.swift
//  SampleProject
//
//  Created by Rami Ounifi on 1/1/2021.
//

import UIKit
enum UserLogin
{
    // MARK: Login request
    struct LoginRequest: Codable {
        let email: String
        let password: String
        
        init(email: String, password: String ) {
            self.email = email
            self.password = password

        }
    }
    // MARK: - LoginResponse
    struct LoginResponse: Codable {
        let user: User
        let token: String
    }

    // MARK: - User
    struct User: Codable {
        let age: Int
        let id, name, email, createdAt: String
        let updatedAt: String
        let v: Int

        enum CodingKeys: String, CodingKey {
            case age
            case id = "_id"
            case name, email, createdAt, updatedAt
            case v = "__v"
        }
    }
}
