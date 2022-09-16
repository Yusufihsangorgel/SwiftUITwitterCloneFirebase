//
//  MainMessageView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 16.09.2022.
//

import SwiftUI

struct MainMessageView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.users){ user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }

                    }
                }
            }
            floatActionButton
            

        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct MainMessageView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessageView()
    }
}

extension MainMessageView {
    
    var floatActionButton: some View {
        Button {
   
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
        
    }
    
}
