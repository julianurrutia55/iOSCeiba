//
//  UserView.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import SwiftUI

struct UserView: View {
    
    @ObservedObject var userViewModel = UserViewModel(repository: UserRemoteRepository())
    @State private var searchText: String = ""

    var body: some View {
        ZStack{
            NavigationView {
                if userViewModel.users.isEmpty {
                    ProgressView()
                }
                else {
                    VStack {
                        SearchBarView(text: $searchText, placeholder: ConstantView.SEARCH_USER)
                        let filterName = userViewModel.users.filter {
                            self.searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())
                        }
                        
                        if filterName.count != 0 {
                            List(filterName, id: \.id) { item in
                                NavigationLink(destination: UserPostView(item: item)) {
                                    ItemsList(item: item)
                                        .padding(.all)
                                    Divider()
                                }
                            }
                        } else {
                            EmptyList()
                        }
                    }
                }
            }.onAppear {
                userViewModel.getUserData()
            }
        }.background(Color.white.opacity(0.9))
    }
    
}

struct ItemsList: View {
    var item: User
    var body: some View {
        VStack (alignment: .leading) {
            Text(item.name)
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.titleColor)
            
            HStack {
                Image(systemName: "phone.fill")
                Text(item.phone)
            }
            
            HStack {
                Image(systemName: "envelope.fill")
                Text(item.email.lowercased())
            }
            
            Text(ConstantView.SEE_PUBLICATIONS)
                .foregroundColor(.titleColor)
                .fontWeight(.bold)
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
        .background(Color.cardsColor)
        .clipShape(RoundedRectangle(cornerRadius: 2))
        .navigationTitle(ConstantView.TITLE_HEADER)
    }
}

struct EmptyList: View {
    var body: some View {
        VStack(alignment: .center, spacing: 250) {
            Spacer()
            Text(ConstantView.LIST_EMPTY)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.titleColor)
        }
    }
}
