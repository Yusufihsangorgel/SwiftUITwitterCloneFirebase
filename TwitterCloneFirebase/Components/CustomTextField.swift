//
//  CustomTextField.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 5.09.2022.
//

import SwiftUI

struct CustomTextField: View {
    let fieldType: fieldType
    let imageName: String
    let placeHolderText: String
    @State var isSecure: Bool = true
    @State var eyeName: String = "eye"
    @Binding var text: String
    var body: some View {
        VStack{
            switch self.fieldType{
            case .NORMALLY:
          
                HStack {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                    TextField(placeHolderText,text: $text)
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.blue))
            case .SECURE:
                
                HStack{
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                    HStack {
                        
                    if isSecure {

                        SecureField(placeHolderText,text: $text)
                           
                    } else {
                        TextField(placeHolderText,text: $text)
                    }
                        Button {
                           eyeNameChanger()
                        } label: {
                            Image(systemName: eyeName)
                            
                        }
                    }
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.blue))
   
                
            }
            Divider()
                .background(.gray)
        }
    }
    
    
    func eyeNameChanger(){
        if eyeName == "eye" {
            eyeName = "eye.slash"
            self.isSecure = true
            
        }else {
           eyeName = "eye"
            self.isSecure = false
        }
    }
    
    
    enum fieldType {
        case NORMALLY,SECURE
    }
    
}

