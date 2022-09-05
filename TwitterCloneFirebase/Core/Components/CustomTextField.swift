//
//  CustomTextField.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 5.09.2022.
//

import SwiftUI

struct CustomTextField: View {
    let imageName: String
    let placeHolderText: String
    @Binding var text: String
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                
                TextField(placeHolderText,text: $text)
            }
            Divider()
                .background(.gray)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(imageName: "enveloper", placeHolderText: "Email", text: .constant("")).previewLayout(.sizeThatFits)
    }
}
