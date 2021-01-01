//
//  Endpoints.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//

import Foundation

enum EndPoints {
    /// cases
    case login
    /// variable path qui retourne l'url a utiliser
    var path: String {
        switch self {
        case .login:  return "/user/login"

        }
    }
}

/// concatination a l'url de base
extension EndPoints: CustomStringConvertible {
    var description: String { return APISettings.serverUrl.appending(path)  }
}

// MARK: - Base URL
private enum BaseUrls: String {
    case usine = "https://api-nodejs-todolist.herokuapp.com"
}

struct APISettings {
    static var serverUrl: String = {
        return BaseUrls.usine.rawValue
    }()
}

