//
//  UserService.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 10.09.2022.
//


import Firebase
import FirebaseFirestoreSwift


struct UserService {
    var db = Firestore.firestore()
    
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        db.collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot  else {return}
                
                guard let user = try? snapshot.data(as: User.self) else {return}
                completion(user)
                
                print("DEBUG: User data is \(user.username)")
            }
    }
}
