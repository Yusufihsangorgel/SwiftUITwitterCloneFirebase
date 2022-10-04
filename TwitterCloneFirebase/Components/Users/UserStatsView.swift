//
//  UserStatsView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24){
            HStack{
                Text("550").font(.subheadline).bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
    
            HStack{
                Text("1240").font(.subheadline).bold()
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}
