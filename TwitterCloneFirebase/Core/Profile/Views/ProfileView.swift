//
//  ProfileView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectionFilter: TweetFilterViewModel = .tweets
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButtons
            bottomProfile
            
            HStack{
                ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                    VStack{
                        Text(item.title)
                            .font(.subheadline)
                            .fontWeight(selectionFilter == item ? .semibold : .regular)
                    }
                }
            }
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


extension ProfileView{
    var headerView: some View {
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }

                Circle()
                    .frame(width: 72, height: 72)
                .offset(x: 16, y: 24)
            }
        }
        .frame( height: 96)
    }
    var actionButtons : some View {
        HStack(spacing: 12){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray,lineWidth: 0.75))
            
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth: 0.75))
            }

        }
        .padding(.trailing)
    }
    
    
    
    var bottomProfile: some View {
        VStack(alignment: .leading,spacing: 4){
            HStack(){
                Text("Yusuf İhsan Görgel")
                    .font(.title2).bold()
                    .frame(width: 200, height: 30)
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
                
            }
            Text("@DeveloperYusuf")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Flutter and SwiftUI Developer")
                .font(.subheadline)
                .padding(.vertical)
            
            
            VStack(alignment: .leading,spacing: 15) {
                HStack(spacing: 24){
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                        Text("Uşak/TR")
                    }
            
                    HStack{
                        Image(systemName: "link")
                        Text("https://github.com/Yusufihsangorgel")
                    }
                }
                .font(.caption)
            .foregroundColor(.gray)
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
        .padding(.horizontal)
    }
}
