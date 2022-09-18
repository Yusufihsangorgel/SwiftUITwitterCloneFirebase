//
//  CreateNewMessageViewModel.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 19.09.2022.
//


import SwiftUI



class CreateNewMessageViewModel: ObservableObject {

    @Published var users = [User]()
    @Published var errorMessage = ""

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

//
//class FirebaseManager: NSObject {
//
//    let auth: Auth
//
//    static let shared = FirebaseManager()
//
//    override init() {
//        FirebaseApp.configure()
//
//        self.auth = Auth.auth()
//
//        super.init()
//    }
//
//}
