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

// likes
extension TweetService{
    func likeTweet(_ tweet:Tweet,completion: @escaping ()->Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        
        Firestore.firestore().collection("tweets").document(tweetId)
            .updateData(["likes": tweet.likes+1]) {_ in
                userLikesRef.document(tweetId).setData([:]){_ in
                    print("like tweet and update now")
                    completion()
                }
            }
        
    }
    
    func unLikeTweet(_ tweet:Tweet,completion: @escaping ()->Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        guard tweet.likes >= 0 else {return}
        let userLikesRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        Firestore.firestore().collection("tweets").document(tweetId)
            .updateData(["likes": tweet.likes-1]) {_ in
                userLikesRef.document(tweetId).delete { _ in
                    completion()
                }
            }
    }
    
    
    func chechkIfUserLikedTweet(_ tweet: Tweet, completion: @escaping(Bool)-> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let tweetId = tweet.id else {return}
        Firestore.firestore().collection("users")
            .document(uid).collection("user-likes")
            .document(tweetId).getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                completion(snapshot.exists)
            }
    }
    
    func fetchLikedTweets(forUid uid: String, completion: @escaping([Tweet]) -> Void){
        var tweets = [Tweet]()
        Firestore.firestore().collection("users").document(uid)
            .collection("user-likes")
            .getDocuments { snaphsot, _ in
                guard let documents = snaphsot?.documents else {return}
                documents.forEach { doc in
                    let tweetID = doc.documentID
                    
                    Firestore.firestore().collection("tweets")
                        .document(tweetID)
                        .getDocument { sa, _ in
                            
                            guard let tweet = try? sa?.data(as: Tweet.self) else {return}
                            
                            tweets.append(tweet)
                            
                            completion(tweets)
                        }
                }
                
            }
    }
    
}


