//
//  SymbolView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 03/04/21.
//

import SwiftUI

struct SymbolView: View {
    
    @State private var rotationCount: Double = 8
    @State private var gradientStart: Color = .blue
    @State private var gradientBottom: Color = .yellow
    @State private var symbolColor: Color = .red
    @State private var opacity: Double = Double.random(in: 0...1)
    
    var badgeSymbols: some View {
        ForEach(0..<Int(rotationCount), id: \.self) { i in
            RotatedBadgeView(
                symbolColor: $symbolColor, angle: .degrees(Double(i) / Double(rotationCount)) * 360.0)
        }
        .opacity(opacity)
    }
    
    func randomDouble() -> Double {
    
        return Double.random(in: 0...255)
    }
    
    func randomColor() -> Color {
        let color = Color(red: randomDouble() / 255, green: randomDouble() / 255, blue: randomDouble() / 255)
        return color
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                BadgeBackgroundView(gradientStart: $gradientStart, gradientEnd: $gradientBottom)
                
                GeometryReader { geometry in
                    badgeSymbols
                        .scaleEffect(1.0 / 4.0, anchor: .top)
                        .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
                } //: GeometryReader
            } //: ZStack
            .scaledToFit()
            
            VStack(spacing: 10) {
                
                VStack(spacing: 5) {
                    Text("Spikes")
                        .font(.title2)
                    Slider(value: $rotationCount, in: 1...10)
                    Text("\(Int(self.rotationCount))")
                        .font(.title3)
                } //: VStack
                
                ColorPicker("Top color:", selection: $gradientStart)
                ColorPicker("Bottom color:", selection: $gradientBottom)
                ColorPicker("Badge color:", selection: $symbolColor)
                
                VStack(spacing: 5) {
                    Text("Opacity")
                        .font(.title2)
                    Slider(value: $opacity, in: 0...1)
                    Text("\( String(format: "%.2f", opacity) )")
                        .font(.title3)
                } //: VStack
            } //: VStack
            .padding()
        } //: VStack
        .onAppear(perform: {
            self.rotationCount = Double(Int.random(in: 1...10))
            self.gradientStart = randomColor()
            self.gradientBottom = randomColor()
            self.symbolColor = randomColor()
            self.opacity = Double.random(in: 0...1)
        })
        .navigationBarTitle("Logo Designer", displayMode: .inline)
    }
}

struct SymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView()
    }
}
