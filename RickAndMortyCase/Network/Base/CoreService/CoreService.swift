//
//  CoreService.swift
//  RickAndMortyCase
//
//  Created by Kaan Yeyrek on 3/15/23.
//

import Foundation
import Alamofire

protocol CoreServiceProtocol: AnyObject {
    func makeRequest<T: Decodable>(endPoint: HTTPEndpoint, completion: @escaping (Result<T, NetworkError>) -> Void)
    func fetchArray<T: Decodable>(endPoint: HTTPEndpoint, completion: @escaping (Result<[T], NetworkError>) -> Void)
}

final class CoreService: CoreServiceProtocol {
    // Make default request
    func makeRequest<T>(endPoint: HTTPEndpoint, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        // set url connection
        var urlComponents = URLComponents()
        urlComponents.scheme = endPoint.scheme
        urlComponents.host = endPoint.host
        urlComponents.path = endPoint.path
        urlComponents.queryItems = endPoint.query
        
        guard let url = urlComponents.url else { return
            completion(.failure(.badURL))
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endPoint.method.rawValue
        // 3rd party library
        AF.request(urlRequest).validate(statusCode: 200..<300).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let decodedData):
                completion(.success(decodedData))
            case .failure(let error):
                switch error {
                case .responseValidationFailed(let reason):
                    print(reason)
                    completion(.failure(.unexpectedStatusCode))
                default:
                    print(error)
                    completion(.failure(.badResponse))
                }
            }
        }
    }
    // Fetch Array Request
    func fetchArray<T>(endPoint: HTTPEndpoint, completion: @escaping (Result<[T], NetworkError>) -> Void) where T : Decodable {
        // set url connection
        var urlComponents = URLComponents()
        urlComponents.scheme = endPoint.scheme
        urlComponents.host = endPoint.host
        urlComponents.path = endPoint.path
        urlComponents.queryItems = endPoint.query
        
        guard let url = urlComponents.url else { return
            completion(.failure(.badURL))
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endPoint.method.rawValue
        // 3rd party library
        AF.request(urlRequest).validate(statusCode: 200..<300).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([T].self, from: data)
                        completion(.success(decodedData))
                    } catch  {
                        print("single api object")
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success([decodedData]))
                    } catch {
                        print(error)
                        completion(.failure(.decoding))
                            }
                    }
                // error handling
            case .failure(let error):
                switch error {
                case .responseValidationFailed(let reason):
                    print(reason)
                    completion(.failure(.unexpectedStatusCode))
                default:
                    print(error)
                    completion(.failure(.badResponse))
                }
            }
        }
    }
}
