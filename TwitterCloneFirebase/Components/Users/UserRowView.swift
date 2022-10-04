//
//  UserRowView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    var body: some View {
     
        HStack(spacing: 12) {
                KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
            .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 5){
                Text(user.fullname)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text(user.username)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical,4)
      
    }
}


