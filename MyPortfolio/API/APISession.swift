//
//  APISession.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 05/04/21.
//

import Combine
import Foundation

protocol APIService {
    static func request<T: Decodable>(with builder: URLRequestBuilder) -> AnyPublisher<T, APIError>
}

// Consume la API con el URLRequest recibido
struct APISession: APIService {
    
    static func request<T>(with builder: URLRequestBuilder) -> AnyPublisher<T, APIError> where T: Decodable {
                
        // URLSession dataTask como publisher
        return URLSession.shared
            .dataTaskPublisher(for: builder.urlRequest)
            // Recive los datos en el main thread
            .receive(on: DispatchQueue.main)
            // Si ocurre un error en el mapeo de datos que recibe, envia un error de tipo desconocido
            .mapError { _ in .unknown }
            // Transforma los datos recibidos en otro Publisher
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                if let response = response as? HTTPURLResponse {
                    // Debugs para mosrar info del request
                    debugPrint("\(builder.urlRequest.url?.path ?? ""): \(response.statusCode)")
                    debugPrint(String(decoding: data, as: UTF8.self))
                    if (200...299).contains(response.statusCode) {
                        // Publica el valor recibido y lo convierte en el genérico recibido
                        return Just(data)
                            .decode(type: T.self, decoder: JSONDecoder())
                            .mapError {_ in .decodingError}
                            .eraseToAnyPublisher()
                    } else {
                        // En otro código de error publica el Fail
                        return Fail(error: APIError.httpError(response.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                return Fail(error: APIError.unknown)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
