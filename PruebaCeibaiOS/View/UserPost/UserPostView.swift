//
//  UserPostView.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import SwiftUI

struct UserPostView: View {
    
    let item: User
    @StateObject var userPostViewModel = UserPostViewModel(repository: UserPostRemoteRepository())

    var body: some View {
        if userPostViewModel.posts.isEmpty {
            ProgressView()
        } else {
            Text(item.name)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.titleColor)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            Divider()
            
            VStack {
                List(userPostViewModel.posts, id: \.id) { item in
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text(ConstantView.TITLE_POST)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.titleColor)
                            
                            Text(item.title)
                        }
                        VStack {
                            Text(ConstantView.DESCRIPTION_POST)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.titleColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(item.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }
}
