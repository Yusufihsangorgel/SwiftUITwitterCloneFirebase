//
//  Tweet.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 15.09.2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable,Decodable{
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    var user: User?
}
