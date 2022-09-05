 //
//  AuthHeader.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 6.09.2022.
//

import SwiftUI

struct AuthHeader: View {
    let title1: String
    let title2: String
    var body: some View {
        VStack(alignment: .leading){
            HStack{Spacer()}
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(.blue)
        . foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight],width: 80,height: 80))
    }
}

struct AuthHeader_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeader(title1: "Hello", title2: "Welcome back")
    }
}
