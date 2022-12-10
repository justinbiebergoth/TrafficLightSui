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

//enum LightState {
//    case lightIsOn = 1.0
//    case lightIsOff = 0.3
//}


struct ContentView: View {
    
    @State var buttonTitle: String = "Start"
    
    @State var currentLightState = CurrentLightState.red
    @State var redOpacity = 0.3
    @State var yellowOpacity = 0.3
    @State var greenOpacity = 0.3
    
    private func switchColor() {
//        if buttonTitle == "Start" {
//            buttonTitle = "Next"
//        }
        
        let lightIsOn = 1.0
        let lightIsOff = 0.3
        
        switch currentLightState {
        case .red:
            redOpacity = 1.0
            yellowOpacity = lightIsOff
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


