//
//  ContentView.swift
//  Traffic
//
//  Created by Khusain on 08.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var redLight = StatusLight.off.value
    @State var yellowLight = StatusLight.off.value
    @State var greenLight = StatusLight.off.value
    
    @State var currentLight = CurrentLight.red
    @State var buttonLabel = "Start"
    
    var body: some View {
        VStack(spacing: 25) {
            CircleView(color: .red, opacity: redLight)
            CircleView(color: .yellow, opacity: yellowLight)
            CircleView(color: .green, opacity: greenLight)
            
            Spacer()
            
            Button(action: { changeTrafficLight() }) {
                Text(buttonLabel)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(minWidth: 200, minHeight: 40)
            }
            .background(.blue)
            .cornerRadius(10)
            .shadow(radius: 7, x: 5, y: 5)
        }
        .padding()
    }
    
    private func changeTrafficLight() {
        if buttonLabel == "Start" {
            buttonLabel = "Next"
        }
        
        switch currentLight {
        case .red:
            greenLight = StatusLight.off.value
            redLight = StatusLight.on.value
            currentLight = .yellow
        case .yellow:
            redLight = StatusLight.off.value
            yellowLight = StatusLight.on.value
            currentLight = .green
        case .green:
            yellowLight = StatusLight.off.value
            greenLight = StatusLight.on.value
            currentLight = .red
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum CurrentLight {
    case red, yellow, green
}

enum StatusLight {
    case off
    case on
    
    var value: Double {
        switch self {
        case .off:
            return 0.6
        case .on:
            return 1.0
        }
    }
    
}
