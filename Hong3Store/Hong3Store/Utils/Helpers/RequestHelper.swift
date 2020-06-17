//
//  RequestHelper.swift
//  Hong3Strore
//
//  Created by Hongdonghyun on 2020/02/28.
//  Copyright © 2020 hong3. All rights reserved.
//

import Foundation

class RequestHelper {
    static let shared = RequestHelper()
    private var currentParam: [String: String] = [:]
    
    func request(method: Constants.RequestMethod, pagination: Constants.pagination, endPoint: Constants.EndPoint, completion: @escaping (Result<Data, Error>) -> ()) {
        
        guard let url = makeUrl(pagination: pagination, endPoint: endPoint) else { return }
        var request = URLRequest(url: url)
        request.url = url
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) {
            data, res, err in
            guard err == nil else { return completion(.failure(err!))}
            if let res = res as? HTTPURLResponse {
                if self.statusValid(statusCode: res.statusCode) {
                    guard let data = data else { return }
                    completion(.success(data))
                }
            }
        }
        task.resume()
    }
    
    func detailRequest(method: Constants.RequestMethod, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = makeUrl(endPoint: .appInfo) else { return }
        var request = URLRequest(url: url)
        request.url = url
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) {
            data, res, err in
            guard err == nil else { return completion(.failure(err!))}
            if let res = res as? HTTPURLResponse {
                if self.statusValid(statusCode: res.statusCode) {
                    guard let data = data else { return }
                    completion(.success(data))
                }
            }
        }
        task.resume()
    }
    
    func makeParam(id: String)  {
        currentParam = ["id": id, "country": "kr"]
    }
    
    private func statusValid(statusCode: Int) -> Bool { (200..<300).contains(statusCode) }
    
    private func makeUrl(pagination page: Constants.pagination? = nil, endPoint: Constants.EndPoint) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        if let page = page {
            components.host = Constants.baseUrl
            components.path = Constants.detailUrl + endPoint.rawValue + page.rawValue
        } else {
            components.host = Constants.detailBaseUrl
            components.path = endPoint.rawValue
            components.queryItems = currentParam.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        return components.url
    }
    
    private init() {}
}

