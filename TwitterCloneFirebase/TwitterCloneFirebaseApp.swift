//
//  TwitterCloneFirebaseApp.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 3.09.2022.
//

import SwiftUI
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct TwitterCloneFirebaseApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authState = AuthViewModel()
    @State var isActive : Bool = false
    
    @State private var size = 0.8
    
    @State private var opacity = 0.5
    
    @StateObject var viewModel = AuthViewModel()
    
   
    
    var body: some Scene {
   
        WindowGroup {
            
            NavigationView{
            if isActive {
                
                ContentView()
                 
                
            } else {
                SplashView(size: $size, opacity: $opacity, isActive: $isActive)
            }
            
            }
            .environmentObject(authState)
            
            
            
           
        }
    }
}
