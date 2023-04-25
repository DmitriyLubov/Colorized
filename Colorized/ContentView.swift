//
//  ContentView.swift
//  Colorized
//
//  Created by Дмитрий Лубов on 25.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = 217.0
    @State private var greenSliderValue = 26.0
    @State private var blueSliderValue = 4.0
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
                .opacity(0.8)
            
            VStack {
                ColorView(
                    red: redSliderValue / 255,
                    green: greenSliderValue / 255,
                    blue: blueSliderValue / 255
                )
                    
                ColorSliderView(value: $redSliderValue, color: .red)
                ColorSliderView(value: $greenSliderValue, color: .green)
                ColorSliderView(value: $blueSliderValue, color: .blue)
                                
                Spacer()
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

struct ColorSliderView: View {
    @Binding var value: Double
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 35, alignment: .leading)
                .foregroundColor(.white)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
        }
    }
}

struct ColorView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red, green: green, blue: blue)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 4)
            )
            .frame(height: 150)
            .padding(.bottom, 30)
    }
}
