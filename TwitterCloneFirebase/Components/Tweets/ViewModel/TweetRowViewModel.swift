//
//  TweetRowViewModel.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 16.09.2022.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    private let service = TweetService()
   @Published var  tweet: Tweet
    
    init(tweet: Tweet){
        self.tweet = tweet
    }
    
    func likeTweet(){
        service.likeTweet(tweet){
            self.tweet.didLike = true
        }
    }
    
    func UNlikeTweet(){
        service.unLikeTweet(tweet){
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet(){
        service.chechkIfUserLikedTweet(tweet) { isLike in
            if isLike{
                self.tweet.didLike = true
            }
        }
    }
}
