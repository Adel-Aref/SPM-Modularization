//
//  File.swift
//  
//
//  Created by Adel Aref on 21/07/2024.
//

import Foundation
import Combine


public protocol ApiClientContract {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType, responseModel: T.Type) -> AnyPublisher<T, APIError>
}

public protocol URLSessionProtocol {
    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher
}

extension URLSession: URLSessionProtocol {}


public class URLSessionAPIClient<EndpointType: APIEndpoint>: ApiClientContract {
    public var session: URLSessionProtocol

    // MARK: - Init

    public init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    // MARK: - Request

    public func request<T: Decodable>(_ endpoint: EndpointType, responseModel: T.Type) -> AnyPublisher<T, APIError> {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body
        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }

        return session.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw APIError.requestFailed
                }

                guard (200 ... 299).contains(httpResponse.statusCode) else {
                    throw APIError.customError(statusCode: httpResponse.statusCode)
                }

                return data
            }
            .decode(type: responseModel, decoder: JSONDecoder())
            .mapError({ error -> APIError in
                guard let error = error as? APIError else {
                    return APIError.decodingFailed
                }
                return error
            })
            .eraseToAnyPublisher()
    }
}


public class NetworkFacade <EndpointType: APIEndpoint>: ApiClientContract {
  
    
    public typealias EndpointType = EndpointType
    
    
    private var networkService = URLSessionAPIClient<EndpointType>()

    
    init(networkService: any ApiClientContract = URLSessionAPIClient<EndpointType>()) {
        self.networkService = networkService as! URLSessionAPIClient<EndpointType>
    }
    
    public func request<T>(_ endpoint: EndpointType, responseModel: T.Type) -> AnyPublisher<T, APIError> where T : Decodable {
        return networkService.request(endpoint, responseModel: responseModel)
    }
}
