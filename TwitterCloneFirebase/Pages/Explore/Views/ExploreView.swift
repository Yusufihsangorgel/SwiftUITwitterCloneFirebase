//
//  ExploreView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()

    var body: some View {
        VStack{
            SearchBar(text: $viewModel.searchText)
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
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
