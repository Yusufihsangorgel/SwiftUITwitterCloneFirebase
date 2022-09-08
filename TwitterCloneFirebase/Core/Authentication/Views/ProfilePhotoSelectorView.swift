//
//  ProfilePhotoSelectorView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 8.09.2022.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack{
            AuthHeader(title1: "Create your account", title2: "Select a profile photo")
            
            
            Button {
                print("")
            } label: {
            Image(systemName: "photo.circle")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.blue)
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .padding(.top,44)
                    
            }

            
            
            Spacer()
        }
        .ignoresSafeArea()
        }
    }


struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
