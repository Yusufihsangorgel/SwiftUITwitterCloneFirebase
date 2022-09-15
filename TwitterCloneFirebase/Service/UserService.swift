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


                    print("İd : \(String(describing: snapshot?.get("uid")))")
                    print("username : \(String(describing: snapshot?.get("username")))")
                    print("fullname : \(String(describing: snapshot?.get("fullname")))")
                    print("profileImageUrl : \(String(describing: snapshot?.get("profileImageUrl")))")
                    print("email : \(String(describing: snapshot?.get("email")))")

                   
                
                 //   data.data(as: User.self) else {return print("offf")}
                    guard let user = try?  data.data(as: User.self) else {return print("gg")}//burada tıkanıyor
                    
                    print("successs")
                completion(user)


            }}
}

    
//    func fetchUser2( completion: @escaping(User) -> Void) {
//            let userUID = Auth.auth().currentUser?.uid
////
////            Firestore.firestore().collection("users").document(userUID!).getDocument { snapshot, error in
////                if error != nil {
////                    print("ahanda bu \(error)")
////                }
////                else {
//                    let uid = snapshot?.get("uid")
//                    let username = snapshot?.get("username")
//                    let fullname = snapshot?.get("fullname")
//                    let profileImageUrl = snapshot?.get("profileImageUrl")
//                    let email = snapshot?.get("email")
//
//                    print("İd : \(uid)")
//                    print("username : \(username)")
//                    print("fullname : \(fullname)")
//                    print("profileImageUrl : \(profileImageUrl)")
//                    print("email : \(email)")
//
//
//
//
////                    let userimiz = User(id: snapshot?.documentID, username: values.decodeIfPresent(String.self, forKey: snapshot?.get("username")), fullname: snapshot?.get("fullname") as! String, profileImageUrl: snapshot?.get("profileImageUrl") as! String, email: snapshot?.get("email") as! String)
//
//
//
//
//               //     let userimiz =  snapshot?.get(User(id: snapshot?.documentID, username: sn, fullname: <#T##String#>, profileImageUrl: <#T##String#>, email: <#T##String#>))
//                 //   print("böyle gelioyr : \(anan)")
////                    let userName = try? snapshot?.get(as: User.init(id: snapshot?.documentID, username: snapshot?.get("username"), fullname: snapshot?.get("fullname"), profileImageUrl: snapshot?.get("profileImageUrl"), email: snapshot?.get("email")))
//                   // print("ahanda bu \(userName)")
//                }
////            }
////        }
    
    
    
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
    

