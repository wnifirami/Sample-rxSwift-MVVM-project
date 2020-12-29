//
//  RouteUtils.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//

import Foundation
extension Routes {
    static func encode<T>(_ value: T?) throws -> Data? where T : Codable {
        guard let object = value else {
            debugPrint("can't encode")
           return nil }
        do {
            let jsonEncoder = JSONEncoder()
            return try jsonEncoder.encode(object.self)
            
        } catch let error {
            debugPrint("can't encode", error)
            return nil
        }
    }
    
  
}
