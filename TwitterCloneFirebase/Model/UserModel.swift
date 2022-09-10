//
//  UserModel.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 10.09.2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable,Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
