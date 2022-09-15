//
//  UserService.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 10.09.2022.
//


import Firebase


struct UserService {
    
    
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                if let error = error {
                                print("DEBUG: Couldnt Fetch Users \(error.localizedDescription)")
                } else {
                guard let data = snapshot  else {return print("1")}
                
                    
                    print("2 \(data)")
                    
//                guard let user = try? snapshot.data(as: User.self) else {return print("offf")} //burada tıkanıyor
//                    print("3")
//                completion(user)
               

                }}
    }
    
    func fetchUsers(completion: @escaping ([User]) -> Void){
        Firestore.firestore().collection("users").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            let users = documents.compactMap({try? $0.data(as: User.self)})
            
//            documents.forEach { document in
//                guard let user = try? document.data(as: User.self) else {return}
//                users.append(user)
//            }
            completion(users)
        }
        
    }
    
    
}
