//
//  UserPostRepositoryProtocol.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import Foundation
protocol UserPostRepositoryProtocol: BaseRepositoryRemote {
    func getUserPostList(completion: @escaping (Result<[PostItem], NetworkError>) -> Void)
}
