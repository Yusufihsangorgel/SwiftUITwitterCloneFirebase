//
//  UserRowView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle().frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 5){
                Text("Yusuf İhsan")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Developer Yusuf")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical,4)
      
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView().previewLayout(.sizeThatFits)
        
        //.previewLayout(.sizeThatFits) its a see only view
    }
}
