//
//  ContentView.swift
//  TrafficLightSui
//
//  Created by hiirari on 10.12.2022.
//

import SwiftUI

enum CurrentLightState {
    case red, yellow, green
}

enum LightState: Double {
    case On = 1.0
    case Off = 0.3
}


struct ContentView: View {
    
    @State var buttonTitle: String = "Start"
    
    @State var currentLightState = CurrentLightState.red
    @State var redOpacity = LightState.Off
    @State var yellowOpacity = LightState.Off
    @State var greenOpacity = LightState.Off
    
    private func switchColor() {
        
        switch currentLightState {
        case .red:
            redOpacity = LightState.On
            yellowOpacity = LightState.Off
            greenOpacity = LightState.Off
            currentLightState = .yellow
            buttonTitle = "Next"
        case .yellow:
            redOpacity = LightState.Off
            yellowOpacity = LightState.On
            greenOpacity = LightState.Off
            currentLightState = .green
        case .green:
            greenOpacity = LightState.On
            redOpacity = LightState.Off
            yellowOpacity = LightState.Off
            currentLightState = .red
        }
        
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                ColorCircleView(color: .red, opacity: redOpacity.rawValue)
                ColorCircleView(color: .yellow, opacity: yellowOpacity.rawValue)
                ColorCircleView(color: .green, opacity: greenOpacity.rawValue)
                
                Spacer()
                
                ButtonView(title: buttonTitle, action: switchColor)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


