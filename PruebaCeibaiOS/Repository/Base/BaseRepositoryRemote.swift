//
//  BaseRepositoryRemote.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import Foundation
class BaseRepositoryRemote {
    
    func sendRequest<T: Decodable>(_ endpoint: String, of: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        let urlString = Constant.BASE_URL + endpoint
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = Constant.METHOD_GET
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            
            guard let letData = data else {
                completion(.failure(.parsingData))
                return
            }
            
            do{
                let json = try JSONDecoder().decode(T.self, from: letData)
                completion(.success(json))
            } catch {
                completion(.failure(.genericError))
            }
        }.resume()
    }
}
