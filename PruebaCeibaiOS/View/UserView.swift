//
//  UserView.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import SwiftUI

struct UserView: View {
    
    @StateObject var userViewModel = UserViewModel(repository: UserRemoteRepository())
    
    var body: some View {
        ZStack{
            NavigationView {
                if userViewModel.users.isEmpty {
                    ProgressView()
                } else {
                    
                }
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
