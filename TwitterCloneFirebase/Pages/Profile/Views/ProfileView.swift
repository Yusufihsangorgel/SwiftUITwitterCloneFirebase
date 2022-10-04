//
//  ProfileView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectionFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var presentation
  //  @State var currentTab: Int = 0
    @Namespace var animation
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User){
        self.viewModel = ProfileViewModel(user: user)
    }
    
    
    
    
    var body: some View {
        VStack(alignment: .leading){
            headerView
            actionButtons
            bottomProfile
           // headerTabBar
           headerCustomTabBar
            
           tweetsView
            
            Spacer()
            
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString, username: "@developeryusuf", fullname: "Yusuf ihsan görgel", profileImageUrl: "", email: "yusuf@gmail.com"))
    }
}


extension ProfileView{
    var headerView: some View {
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack {
                Button {
                    self.presentation.wrappedValue.dismiss()
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: -4)
                }

                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
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
                Text(viewModel.actionButtonTitle)
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
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                    .frame(width: 200, height: 30)
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
                
            }
            Text("\(viewModel.user.username)")
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
            UserStatsView()
                    .padding(.vertical)
            }
            
            
            
            
        }
        .padding(.horizontal)
    }
    
    var headerCustomTabBar: some View {
        HStack{
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectionFilter == item ? .semibold : .regular)
                        .foregroundColor(selectionFilter == item ? .black : .gray)
                    
                    if selectionFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "filter", in: animation)
     
                        
                    }
                    else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                    }
                }
                
                .onTapGesture {
                    withAnimation(.easeInOut){
                        self.selectionFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y:16))
        .frame(width: .infinity , height: 20)
        
        
    }
    
    var tweetsView: some View {
        ScrollView{
            LazyVStack{
                ForEach(viewModel.tweets(forFilter: self.selectionFilter)){tweet in
                    TweetsRowView(tweet: tweet)
                       .padding()
                }
            }
        }
    }
    
    
//    var headerTabBar: some View {
//        ZStack(alignment: .top) {
//                    TabView(selection: self.$currentTab) {
//                        ExploreView().tag(0)
//                        NotificationsView().tag(1)
//                        MessagesView().tag(2)
//                    }
//                    .tabViewStyle(.page(indexDisplayMode: .never))
//                    .edgesIgnoringSafeArea(.all)
//
//                    TabBarView(currentTab: self.$currentTab)
//                }
//    }
   
}

//struct TabBarView: View {
//    @Binding var currentTab: Int
//    @Namespace var namespace
//
//    var tabBarOptions: [String] = ["Hello World", "This is", "Something cool that I'm doing"]
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 20) {
//                ForEach(Array(zip(self.tabBarOptions.indices,
//                                  self.tabBarOptions)),
//                        id: \.0,
//                        content: {
//                    index, name in
//                    TabBarItem(currentTab: self.$currentTab,
//                               namespace: namespace.self,
//                               tabBarItemName: name,
//                               tab: index)
//
//                })
//            }
//            .padding(.horizontal)
//        }
//        .background(Color.white)
//        .frame(height: 80)
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct TabBarItem: View {
//    @Binding var currentTab: Int
//    let namespace: Namespace.ID
//
//    var tabBarItemName: String
//    var tab: Int
//
//    var body: some View {
//        Button {
//            self.currentTab = tab
//        } label: {
//            VStack {
//                Spacer()
//                Text(tabBarItemName)
//                if currentTab == tab {
//                    Color.black
//                        .frame(height: 2)
//                        .matchedGeometryEffect(id: "underline",
//                                               in: namespace,
//                                               properties: .frame)
//                } else {
//                    Color.clear.frame(height: 2)
//                }
//            }
//            .animation(.spring(), value: self.currentTab)
//        }
//        .buttonStyle(.plain)
//    }
//}
