//
//  MainMessageView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 16.09.2022.
//

import SwiftUI

struct MessageView: View {
    @State private var showNewMessageView = false
    @State var shouldNavigateToChatLogView = false
    @ObservedObject var viewModel = CreateNewMessageViewModel()
    @State var messageUser: User?
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.users){ user in
                        NavigationLink {
                            MessageLogView(chatUser: user)
                        } label: {
                            UserRowView(user: user)
                        }

                    }

                }
            }
            
            floatActionButton
            

        }
    }
}


struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

extension MessageView {
    
    var floatActionButton: some View {
        Button {
            showNewMessageView.toggle()
        } label: {
            Image(systemName: "message")
                .resizable()
                .renderingMode(.template)
                .frame(width: 28, height: 28)
                .padding()
        }
        .background(.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .padding()
        .fullScreenCover(isPresented: $showNewMessageView) {
            NewMessageView(didSelectNewUser: { user in
                print(user.email)
                self.messageUser = user
            })
            //Fullscreencover is look like a new page in the page
        }
        
    }
    

    
}
