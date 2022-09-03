//
//  ContentView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .topLeading){
            MainTabView()
        }
    }
}
// This Zstack for the Upper spacing because upper spacing is use for the user profile - title

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
