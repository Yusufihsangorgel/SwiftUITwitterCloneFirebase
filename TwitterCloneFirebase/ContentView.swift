//
//  ContentView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI
//import Kingfisher

struct ContentView: View {
    // if the user click de circle button , this toggle working and showmenu true
    @EnvironmentObject var viewModel: AuthViewModel

   
    
   // let url = URL(string: "https://c.tenor.com/cGd-T9BNSkkAAAAC/twitter.gif")
    
    var body: some View {
        
                if viewModel.userSession == nil {
                    //not have user
                    LoginView()
                } else {
                    //have a user
                    MainTabView()
                }
            
            
    }
        

    }

// This Zstack for the Upper spacing because upper spacing is use for the user profile - title



// extension ContentView {
//    var haveUserView: some View {
//        ZStack(alignment: .topLeading){
//            MainTabView(titleName: titleName)
//                .navigationBarHidden(showMenu)
//
//            if showMenu {
//                ZStack{
//                    Color(.black)
//                        .opacity(showMenu ? 0.25 : 0.0)
//                }.onTapGesture {
//                    withAnimation(.easeInOut) {
//                        showMenu = false
//                    }
//                }
//                .ignoresSafeArea()
//            }
//
//            SideMenuView()
//                .frame(width: 300)
//                .offset(x: showMenu ? 0 : -300, y : 0)
//            // this offset work for  sidemenu open and off
//                .background(showMenu ? .white : .clear)
//        }
//        .navigationTitle("\(titleName)")
//        .navigationBarTitleDisplayMode(.inline)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                if let user = viewModel.currentUser{
//                    Button {
//                        withAnimation(.easeInOut) {
//                            showMenu.toggle()
//                        }
//                    } label: {
//                        KFImage(URL(string: user.profileImageUrl))
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 32, height: 32)
//                            .clipShape(Circle())
//                    }
//                }
//                else {
//                    Button {
//                        withAnimation(.easeInOut) {
//                            showMenu.toggle()
//                        }
//                    } label: {
//                        Circle()
//
//                            .foregroundColor(.blue)
//                            .frame(width: 32, height: 32)
//
//                    }
//                }
//
//            }
//        }
//        .onAppear{
//            showMenu = false
//        }
//    }
//
//
//}

