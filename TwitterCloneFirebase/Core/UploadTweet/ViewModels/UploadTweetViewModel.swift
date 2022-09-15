//
//  UploadTweetViewModel.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 15.09.2022.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetService()
    
        func uploadTweet(withCaptipn caption: String){
            service.uploadTweet(caption: caption){ success in
                if success {
                    self.didUploadTweet = true
                } else {
                 //   self.didUploadTweet = false
                }
            }
        }
    }

