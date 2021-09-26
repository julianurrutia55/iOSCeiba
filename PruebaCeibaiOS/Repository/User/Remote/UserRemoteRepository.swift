//
//  UserRemoteRepository.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import Foundation

class UserRemoteRepository: BaseRepositoryRemote, UserRepositoryProtocol {
    
    func getUserList(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        let endPoint = Constant.END_POINT_USER
        if validateEsxistUser() {
            sendRequest(endPoint, of: [User].self) { result in
                switch result {
                case .success(let breeds):
                    completion(.success(breeds))
                    break
                case.failure(let error):
                    completion(.failure(error))
                    break
                }
            }
        }
    }
    
    private func saveUser() -> Bool{
        return true
    }
    
    private func validateEsxistUser() -> Bool{
        return true
    }
    
    private func getUserCoreData() -> [User]?{
        return nil
    }
}
