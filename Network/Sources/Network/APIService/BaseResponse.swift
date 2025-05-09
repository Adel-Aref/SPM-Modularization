//
//  BaseResponse.swift
//  
//
//  Created by Adel Aref on 27/06/2024.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    var code: Int?
    var reason: String?
    var data: T?
}

public enum APIError: Error, Equatable {
    case requestFailed
    case decodingFailed
    case customError(statusCode: Int)
}
