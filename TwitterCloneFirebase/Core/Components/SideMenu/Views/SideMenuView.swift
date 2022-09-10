//
//  SideMenuView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading,spacing: 32) {
                VStack(alignment: .leading){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    Text(user.fullname)
                        .font(.headline)
                    
                    VStack(alignment: .leading,spacing: 4) {
                        Text("@\(user.username)")
                            .font(.caption)
                        .foregroundColor(.gray)
                    }
                    UserStatsView()
                        .padding(.vertical)
                }
                .padding(.leading)
                ForEach(SideMenuViewModel.allCases, id: \.rawValue){ viewModel in
                    if viewModel == .profile{
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }

                    } else if viewModel == .logout {
                        Button {
                            authViewModel.signOut()
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }

                    } else {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                    
                }

                Spacer()
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView().previewLayout(.sizeThatFits)
    }
}
