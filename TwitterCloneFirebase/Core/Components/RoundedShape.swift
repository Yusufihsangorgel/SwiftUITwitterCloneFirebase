//
//  RoundedShape.swift
//  TwitterCloneFirebase
//
//  Created by Yusuf İhsan Görgel on 4.09.2022.
//

import SwiftUI

struct RoundedShape: Shape {
    var corners: UIRectCorner
    var width: Double
    var height: Double
    
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: width, height: height))
        
        return Path(path.cgPath)
    }
}

