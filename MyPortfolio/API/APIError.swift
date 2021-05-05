//
//  APIError.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 05/04/21.
//

import Foundation

// Errores que se pueden presentar en el consumo de API's
enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
