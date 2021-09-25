//
//  UserRepositoryProtocol.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import Foundation

protocol UserRepositoryProtocol: BaseRepositoryRemote {
    func getUserList(completion: @escaping (Result<[User], NetworkError>) -> Void)
}
