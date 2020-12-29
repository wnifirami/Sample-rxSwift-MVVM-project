//
//  ApiResponse.swift
//  SampleProject
//
//  Created by Rami Ounifi on 29/12/2020.
//

import Foundation
public enum APIError: Error {
    case parsingFailed
    case notConnectedToInternet
    case timedOut
}
