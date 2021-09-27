//
//  UserRemoteRepository.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import CoreData
import SwiftUI

class UserRemoteRepository: BaseRepositoryRemote, UserRepositoryProtocol {
    
    func getUserList(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        let endPoint = Constant.END_POINT_USER
       
            sendRequest(endPoint, of: [User].self) { result in
                switch result {
                case .success(let users):
                    self.saveUser(users: users)
                    completion(.success(users))
                    break
                case.failure(let error):
                    completion(.failure(error))
                    break
                }
            }
        
    }
    
    private func saveUser(users: [User]){
        let context = PersistenceController.shared.container.viewContext
        
        for user in users {
            let userEntity = UserEntity(context: context)
            userEntity.id = Int32(user.id)
            userEntity.name = user.name
            userEntity.phone = user.phone
            userEntity.email = user.email
        }
        
        do {
            try context.save()
            print("guardo")
        } catch let error as NSError {
            print("No guardo ", error.localizedDescription)
        }
    }
    
    private func validateExistUser() -> Bool {
        if let users = getFetchUserCoreData() {
            return false
        } else {
            return true
        }
    }
    
    private func getFetchUserCoreData() -> [UserEntity]?{
        let context = PersistenceController.shared.container.viewContext
        let fe =  NSFetchRequest<UserEntity>(entityName: "UserEntity")
        do {
            return  try context.fetch(fe)
          } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
          }
        return nil
    }
}
