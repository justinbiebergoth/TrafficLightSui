//
//  ButtonView.swift
//  TrafficLightSui
//
//  Created by hiirari on 10.12.2022.
//

import SwiftUI

struct ButtonView: View {
    let title: String
     let action: () -> Void
    
    var body: some View {
        Button("Start") {
        }
        .font(.largeTitle)
        .fontWeight(.bold)
        .frame(width: 150, height: 40)
        .foregroundColor(.white)
        .overlay(Capsule().stroke(Color.white, lineWidth: 4))
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "123123", action: {})
    }
}
