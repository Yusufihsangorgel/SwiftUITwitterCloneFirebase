//
//  ExploreViewModel.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 12.09.2022.
//


import SwiftUI


class ExploreViewModel: ObservableObject {
   
    @Published var users = [User]()
    @Published var searchText = ""
    var searchWithUsers: [User]{
        if searchText.isEmpty{
            return users
        }else {
            let lowerCasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowerCasedQuery) ||     $0.fullname.lowercased().contains(lowerCasedQuery)
            })
        }
    }
    
    let service = UserService()
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
            
            print("users : \(users)")
        }
    }
    
    
}
