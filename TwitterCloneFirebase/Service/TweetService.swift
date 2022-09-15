//
//  TweetService.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 15.09.2022.
//

import Firebase

struct TweetService {
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid": uid, "caption": caption , "likes": 0 , "timestap": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("tweets")
            .document().setData(data) { error in
                if let error = error {
                    print("completion false \(error)")
                    completion(false)
                    return
                }
                
                completion(true)
                
            }
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .order(by: "timestap",descending: true)
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            let tweets = documents.compactMap({try? $0.data(as: Tweet.self)})
            completion(tweets)
            
        }
        
    }
    
    func fetchTweets(forUid uid: String,completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            let tweets = documents.compactMap({try? $0.data(as: Tweet.self)})
                completion(tweets.sorted(by: {$0.timestap.dateValue()>$1.timestap.dateValue()}))
            
        }
        
    }
    
}
