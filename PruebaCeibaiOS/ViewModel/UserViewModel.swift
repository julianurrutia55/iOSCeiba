//
//  UserRemoteRepository.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import Foundation

class UserViewModel: ObservableObject {
    
    @Published var users:[User] = []
    @Published var usersFiltered: [User] = []
    private var error: NetworkError?
    var repository: UserRemoteRepository
    
    init(repository: UserRemoteRepository) {
        self.repository = repository
    }
    
    func getUserData() {
        repository.getUserList(completion: { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
                break
            case .failure(let error):
                print("")
            }
        })
    }
}
