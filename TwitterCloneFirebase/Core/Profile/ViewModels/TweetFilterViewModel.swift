//
//  TweetFilterViewModel.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import Foundation

enum TweetFilterViewModel: Int , CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
    case .tweets: return "Tweets"
    case .replies: return "Replies"
    case .likes: return "Likes"
    }
}
}

//caseIterable sayesinde kendi içinde bir loop olacak ve sırasıyla hepsi gelecek title ı çekince allcases kullanarak
