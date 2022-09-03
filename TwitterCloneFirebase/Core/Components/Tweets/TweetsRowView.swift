//
//  TweetsRowView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI

struct TweetsRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12){
                Circle().frame(width: 56, height: 56)
                    .foregroundColor(.blue)
                VStack(alignment: .leading, spacing: 4){
                    HStack{
                        Text("Yusuf İhsan Görgel")
                            .font(.subheadline).bold()
                        Text("@DeveloperYusuf")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    Text("I Coding mobile applications")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                }
            }
            HStack{
                Button {
                    //action
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
         

            }
            .padding()
            .foregroundColor(.gray)
            Divider()
        }
    }
}

struct TweetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetsRowView()
    }
}
