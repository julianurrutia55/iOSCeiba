//
//  NetworkError.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import Foundation

enum NetworkError: String, Error {
    case parsingData = "Error al parsear json."
    case genericError = "Error en lectura de datos"
}
