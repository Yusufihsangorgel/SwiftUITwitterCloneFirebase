//
//  SearchBar.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 15.09.2022.
//

import SwiftUI

struct SearchBar: View {
    var colorSearchBar: UIColor = .systemGray6
    @Binding var text: String
    var body: some View {
        HStack{
            TextField("Search..", text: $text)
                .padding(8)
                .padding(.horizontal,24)
                .background(Color(colorSearchBar))
                .cornerRadius(8)
                .overlay(
                
                    HStack{
                        Image(systemName: "magnifyinggclass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                            .padding(.leading,8)
                    }
                
                )
               
        }
        .padding(.horizontal,4)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
