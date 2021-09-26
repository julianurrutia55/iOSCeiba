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
            
        }
    }
}
