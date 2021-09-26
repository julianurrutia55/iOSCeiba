//
//  UserPostView.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import Foundation

class UserPostViewModel: ObservableObject {
    
    @Published var posts:[PostItem] = []
    private var error: NetworkError?
    private var repository: UserPostRemoteRepository
    
    init(repository: UserPostRemoteRepository) {
        self.repository = repository
        getUserPostData()
    }
    
    func getUserPostData() {
        repository.getUserPostList(completion: { [weak self] result in
            switch result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self?.posts = posts
                }
            case .failure(let error):
                print("")
            }
        })
    }
}
