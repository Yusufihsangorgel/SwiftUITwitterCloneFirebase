//
//  RegisterView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 4.09.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing: 40){
            AuthHeader(title1: "Get started.", title2: "Create your account.")
            
            VStack(spacing: 50){
                CustomTextField(imageName: "envelope", placeHolderText: "Email", text: $email)
                
                CustomTextField(imageName: "person", placeHolderText: "Username", text: $username)
                CustomTextField(imageName: "person", placeHolderText: "Full Name", text: $fullname)
                
                CustomTextField(imageName: "lock", placeHolderText: "Password", text: $password)
            }
            .padding(20)
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray, radius: 10, x: 0, y: 0)
            
            
            
            Spacer()
            
            
            
            
            NavigationLink {
                LoginView().navigationBarHidden(true)
            } label: {
                Text("Already have an account? Sign In")
                    .font(.footnote)
                
                Text("Sign In")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .padding(.bottom,32)
            .foregroundColor(.blue)
        }
        .ignoresSafeArea()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
