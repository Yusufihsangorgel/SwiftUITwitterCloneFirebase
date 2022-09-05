//
//  LoginView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 4.09.2022.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack{
            AuthHeader(title1: "Hello.", title2: "Welcome Back.")
            
            
            VStack(spacing: 40){
                CustomTextField(imageName: "envelope", placeHolderText: "Email", text: $email)
                
                CustomTextField(imageName: "lock", placeHolderText: "Password", text: $password)
            }
            .padding(.horizontal,32)
            .padding(.top,44 )
            
            HStack{
                Spacer()
                
                NavigationLink {
                    Text("Reset Password")
                } label: {
                    Text("Forgot Password ?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top)
                        .padding(.trailing,24)
                }

            }
            Button {
                print("")
            } label: {
                Text("Sign In")
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
                RegisterView().navigationBarHidden(true)
            } label: {
                Text("Don't have an account?")
                    .font(.footnote)
                
                Text("Sign Up")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .padding(.bottom,32)
            .foregroundColor(.blue)

            
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
