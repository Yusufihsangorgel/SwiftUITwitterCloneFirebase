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
    @EnvironmentObject var viewModel: AuthViewModel
    @State var isValidEmail = true
    @State var isValidPassword = true
    @State var isValidusername = true
    @State var isValidfullname = true
    var body: some View {
        VStack(spacing: 40){
            AuthHeader(title1: "Get started.", title2: "Create your account.")
            
            VStack(spacing: 50){
                CustomTextField(fieldType: .NORMALLY, imageName: "envelope", placeHolderText: "Email", text: $email)
                if !self.isValidEmail {
                    Text("Please check email")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                      
                }
                
                CustomTextField(fieldType: .NORMALLY, imageName: "person", placeHolderText: "Username", text: $username)
                if !self.isValidusername {
                    Text("Please check Username min 5 characters")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                      
                }
                
                CustomTextField(fieldType: .NORMALLY, imageName: "person", placeHolderText: "Full Name", text: $fullname)
                if !self.isValidfullname {
                    Text("Please check name min 4 characters")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                      
                }
                
                CustomTextField(fieldType: .SECURE, imageName: "lock", placeHolderText: "Password", text: $password)
                if !self.isValidPassword {
                    Text("Please check password")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                      
                }
            }
            .padding(20)
            
            Button {
                valid()
                
                if(self.isValidEmail && self.isValidPassword && self.isValidfullname && self.isValidusername ) {
                    viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
                }
             
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
    
    func valid()  {
       isValidEmail = email.isValidWith(regexType: .email)
      isValidPassword = password.isValidWith(regexType: .minLetters(8))
        isValidusername = username.isValidWith(regexType: .minLetters(5))
        isValidfullname = fullname.isValidWith(regexType: .minLetters(3))
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
