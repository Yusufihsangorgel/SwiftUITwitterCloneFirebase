//
//  NewMessageView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 19.09.2022.
//

import SwiftUI
import Kingfisher


//struct NewMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewMessageView(didSelectNewUser: (User) -> ())
//    }
//}

struct NewMessageView: View {
    let didSelectNewUser: (User) -> ()
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var vm = CreateNewMessageViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                Text(vm.errorMessage)

                ForEach(vm.users) { user in
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack(spacing: 16) {
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipped()
                                .cornerRadius(50)
                                .overlay(RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color(.label), lineWidth: 2)
                                )
                            Text(user.username)
                                .foregroundColor(Color(.label))
                            Spacer()
                        }.padding(.horizontal)
                    }
                    Divider()
                        .padding(.vertical, 8)
                }
            }.navigationTitle("New Message")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
        }
    }
}
