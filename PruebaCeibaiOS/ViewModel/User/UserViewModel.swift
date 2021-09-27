//
//  UserRemoteRepository.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import CoreData

class UserViewModel: ObservableObject {
    
    @Published var users:[User] = []
    private var error: NetworkError?
    private var repository: UserRemoteRepository
    
    init(repository: UserRemoteRepository) {
        self.repository = repository
    }
    
    func getUserData() {
        repository.getUserList(completion: { [weak self] result in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self?.users = users
                }
            case .failure(let error):
                print("")
            }
        })
    }
}
