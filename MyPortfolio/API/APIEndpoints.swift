//
//  APIEndpoints.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 05/04/21.
//

import Foundation

// Métodos HTTP
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

// Protocolo para asegurar que los Endpoints estan ligados a un URL
protocol URLBuilder {
    var url: URL {get}
}

// Protocolo para asegurar que los Endpoints estan ligados a un URLRequest
protocol URLRequestBuilder {
    var urlRequest: URLRequest {get}
}

enum APIEndpoints {
    
    case getPokemons
}

extension APIEndpoints: URLBuilder {
    
    var url: URL {
        switch self {
        case .getPokemons:
            return getURL(from: "https://pokeapi.co/api/v2/pokemon")
        }
    }
    
    /// Función para crear un URL a partir de la String recibido
    /// - Parameter path: URL en forma de String
    /// - Returns: Una URL para consumir, fallo en otro caso
    private func getURL(from path: String) -> URL {
        guard let url = URL(string: path) else {
            preconditionFailure("Invalid URL format")
        }
        return url
    }
}

extension APIEndpoints: URLRequestBuilder {

    var urlRequest: URLRequest {
        switch self {
        case .getPokemons:
            var queryItems = [URLQueryItem]()
            queryItems.append(URLQueryItem(name: "limit", value: "151"))
            return createURLRequest(method: .get, queryItems: queryItems)
        }
    }
    
    /// Función para crear un URLRequest con los parámetros recibidos
    /// - Parameters:
    ///   - url: URL recibida
    ///   - method: HTTPMethod
    ///   - body: Cuerpo del Request (POST)
    ///   - queryItems: QueryItems (GET)
    /// - Returns: Una URL Request con la URL y los datos recibidos
    private func createURLRequest(method: HTTPMethod, body: [String: Any]  = [:], queryItems: [URLQueryItem] = []) -> URLRequest {
        var request = URLRequest(url: self.url)
        request.httpMethod = method.rawValue
        switch method {
        case .get:
            var requestComponents = URLComponents(url: self.url, resolvingAgainstBaseURL: true)
            requestComponents?.queryItems = queryItems
            guard let urlComponents = requestComponents?.url else {
                preconditionFailure("Invalid URL with query Items \(url.absoluteString) \(queryItems)")
            }
            request = URLRequest(url: urlComponents)
        case .post:
            var data: Data?
            do {
                data = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                preconditionFailure("Error during JSON DataSerialization: \(error.localizedDescription)")
            }
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        }
        return request
    }
}

