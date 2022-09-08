//
//  TwitterCloneFirebaseApp.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneFirebaseApp: App {
    
    @State var isActive : Bool = false
    
    @State private var size = 0.8
    
    @State private var opacity = 0.5
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView{
            if isActive {
                
                 ContentView()
       
                
            } else {
                SplashView(size: $size, opacity: $opacity, isActive: $isActive)
            }
            
            }
            .environmentObject(viewModel)
            
            
            
           
        }
    }
}
