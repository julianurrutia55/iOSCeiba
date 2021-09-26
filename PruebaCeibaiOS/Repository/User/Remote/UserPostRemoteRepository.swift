//
//  UserPostRemoteRepository.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import Foundation

class UserPostRemoteRepository: BaseRepositoryRemote, UserPostRepositoryProtocol {
    let endPoint = Constant.END_POINT_USER_POSTS
    
    func getUserPostList(completion: @escaping (Result<[PostItem], NetworkError>) -> Void) {
        sendRequest(endPoint, of: [PostItem].self) { result in
            switch result {
            case .success(let posts):
                completion(.success(posts))
                break
            case.failure(let error):
                completion(.failure(error))
                break
            }
        }
    }
}
