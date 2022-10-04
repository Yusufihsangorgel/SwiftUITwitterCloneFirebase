//
//  SideMenuViewModel.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import Foundation

enum SideMenuViewModel: Int , CaseIterable {
    case profile
    case lists
    case bookmarks
    case logout
    
    var description: String {
        switch self {
        case .profile: return "Profile"
        case .lists: return "Lists"
        case .bookmarks: return "Bookmarks"
        case .logout: return "Logout"
            
        }
    }
    
    var imageName: String{
        switch self {
        case .profile: return "person"
        case .lists: return "list.bullet"
        case .bookmarks: return "bookmark"
        case .logout: return "arrow.left.square"
            
        }
    }
}

//This switch case mean is for example in user open the SideMenu First row is Enum: Profile --> String "Profile" and image is "person" okay.


