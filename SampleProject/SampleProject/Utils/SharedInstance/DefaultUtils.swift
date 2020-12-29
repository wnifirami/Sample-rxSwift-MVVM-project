//
//  DefaultUtils.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//

import Foundation
import UIKit
import Alamofire

protocol ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}

struct DefaultUtils {
    
    //Singleton Pattern
    static var sharedInstance = DefaultUtils()
    
    let userDefaults = UserDefaults.standard
    
    // language app
    var userLanguage: String? {
        get { return userDefaults.string(forKey: "userLanguage") }
        set(newValue) {
            userDefaults.set(newValue, forKey: "userLanguage") }
    }
    
    // userStatus
    var userStatus: String?   {
        get { return userDefaults.string(forKey: "userType") ?? ""  }
        set(newValue) {
            userDefaults.set(newValue, forKey: "userType") }
    }
    
    var userHeader: HTTPHeaders? {
        get {
            guard let headers = userDefaults.dictionary(forKey:"header") as? HTTPHeaders else {
                debugPrint("we can't get the headers")
                return HTTPHeaders()
            }
            return  headers
        }
        
        set(newValue) {
            userDefaults.set(newValue, forKey: "header")
        }
    }
}

extension DefaultUtils: ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            userDefaults.set(data, forKey: forKey)
        } catch {
            throw ObjectSavableError.unableToEncode
        }
    }
    
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
        guard let data =  userDefaults.data(forKey: forKey) else { throw ObjectSavableError.noValue }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw ObjectSavableError.unableToDecode
        }
    }
}


enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
        rawValue
    }
}
