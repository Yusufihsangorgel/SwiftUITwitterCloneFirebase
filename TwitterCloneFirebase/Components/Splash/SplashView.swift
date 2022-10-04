//
//  SplashView.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 7.09.2022.
//

import SwiftUI
import Kingfisher

struct SplashView: View {
    @Binding var size: Double
    @Binding var opacity: Double
    @Binding var isActive: Bool
    
    
    var body: some View {
        VStack {
            VStack {
                KFImage(URL(string: "https://www.waseefakhtar.com/content/images/2021/04/14.gif"))
                  
                    
                
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 0.9
                    self.opacity = 1.00
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

