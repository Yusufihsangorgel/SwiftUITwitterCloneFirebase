//
//  ContentView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
  
    // if the user click de circle button , this toggle working and showmenu true
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showMenu = false
   
    
    let url = URL(string: "https://c.tenor.com/cGd-T9BNSkkAAAAC/twitter.gif")
    
    var body: some View {

   
            Group{
                if viewModel.userSession == nil {
                    //not have user
                    LoginView()
                } else {
                    //have a user
                    haveUserView
                }
            
            }
    }
        

    }

// This Zstack for the Upper spacing because upper spacing is use for the user profile - title



 extension ContentView {
    var haveUserView: some View {
        ZStack(alignment: .topLeading){
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack{
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y : 0)
            // this offset work for  sidemenu open and off
                .background(showMenu ? .white : .clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user = viewModel.currentUser{
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    }
                }

            }
        }
        .onAppear{
            showMenu = false
        }
    }
     
     
//     var splashView: some View {
//         VStack {
//             VStack {
//                 KFImage(URL(string: "https://www.waseefakhtar.com/content/images/2021/04/14.gif")!)
//                     .resizable()
//             }
//             .scaleEffect(size)
//             .opacity(opacity)
//             .onAppear {
//                 withAnimation(.easeIn(duration: 1.2)) {
//                     self.size = 0.9
//                     self.opacity = 1.00
//                 }
//             }
//         }
//         .onAppear {
//             DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                 withAnimation {
//                     self.isActive = true
//                 }
//             }
//         }
//     }
    
}

