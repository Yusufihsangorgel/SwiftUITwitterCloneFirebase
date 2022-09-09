//
//  ProfilePhotoSelectorView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 8.09.2022.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            AuthHeader(title1: "Create your account", title2: "Select a profile photo")
            
            
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
//                        .resizable()
//                        .renderingMode(.template)
                      .modifier(ProfileImageModifier())
                            
                } else {
                    Image(systemName: "photo.circle")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                            
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top,44)

            if  let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray, radius: 10, x: 0, y: 0)
            }
            
            
            Spacer()
        }
        .ignoresSafeArea()
        }
    
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)

    }
    
    }

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}



private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content

            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}



