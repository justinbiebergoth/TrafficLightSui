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

let lightIsOn = 1.0
let lightIsOff = 0.3

struct ContentView: View {
    
    @State var buttonTitle: String = "Start"
    
    @State var currentLightState = CurrentLightState.red
    @State var redOpacity = lightIsOff
    @State var yellowOpacity = lightIsOff
    @State var greenOpacity = lightIsOff
    
    private func switchColour() {
        
        
        switch currentLightState {
        case .red:
            redOpacity = lightIsOff
            yellowOpacity = lightIsOn
            currentLightState = .yellow
            buttonTitle = "Next"
        case .yellow:
            yellowOpacity = lightIsOff
            greenOpacity = lightIsOn
            currentLightState = .green
        case .green:
            greenOpacity = lightIsOff
            redOpacity = lightIsOn
            currentLightState = .red
        }
        
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                ColorCircleView(color: .red, opacity: redOpacity)
                ColorCircleView(color: .yellow, opacity: yellowOpacity)
                ColorCircleView(color: .green, opacity: greenOpacity)
                
                Spacer()
                
                ButtonView(title: buttonTitle, action: switchColour)
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


