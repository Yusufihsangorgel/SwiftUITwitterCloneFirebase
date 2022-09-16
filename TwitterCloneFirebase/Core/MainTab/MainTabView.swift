//
//  MainTabView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI
import Kingfisher
struct MainTabView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showMenu = false
    @State private var selectedIndex: Int = 0
    @State  var titleName = "Home"
    
    
    
    func titleChange(){
        print("tetiklendi")
        if self.selectedIndex == 0 {
            self.titleName = "Home"
        }
        else if selectedIndex == 1 {
            self.titleName = "Explore"
        }
        else if selectedIndex == 2 {
            self.titleName = "Notifications"
        }
        else if selectedIndex == 3 {
            self.titleName = "Messages"
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            tabView
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
        .navigationTitle(
            "\(self.titleName)"
        )
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
}

extension MainTabView {
    
    var tabView: some View{
        TabView(selection:$selectedIndex) {
            FeedView()
                .onTapGesture {
                    titleChange()
                    self.selectedIndex = 0
             
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            ExploreView()
                .onTapGesture {
                    titleChange()
                    self.selectedIndex = 1
                   
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            NotificationsView()
                .onTapGesture {
                    titleChange()
                    self.selectedIndex = 2
                  
                }
                .tabItem {
                    Image(systemName: "bell")
                }.tag(2)
            MainMessageView()
                .onTapGesture {
                    titleChange()
                    self.selectedIndex = 3
        
                }
                .tabItem {
                    Image(systemName: "envelope")
                }.tag(3)
        }
    }
}
