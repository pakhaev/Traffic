//
//  CircleView.swift
//  Traffic
//
//  Created by Khusain on 08.06.2023.
//

import SwiftUI

struct CircleView: View {
    let color: Color
    var opacity: Double
    
    var body: some View {
        Circle()
            .frame(width: 120, height: 120)
            .foregroundColor(color)
            .shadow(color: .secondary, radius: 7, x: 5, y: 3)
            .overlay(Circle().stroke(Color.clear, lineWidth: 4))
            .opacity(opacity)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .red, opacity: 0.6)
    }
}
