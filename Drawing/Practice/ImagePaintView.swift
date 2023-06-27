//
//  ImagePaintView.swift
//  Drawing
//
//  Created by Rob Ranf on 6/26/23.
//

import SwiftUI

struct ImagePaintView: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image("madison"),
                               sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5),
                               scale: 0.13), width: 30)
        
        Capsule()
            .strokeBorder(ImagePaint(image: Image("madison"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)
    }
}

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps, id: \.self) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top, endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        // Adding this modifier tells SwiftUI it should render the contents of the view into an
        // off-screen image before putting it back onto the screen as a single rendered output
        // which improves performance, but is mainly useful only if a performance problem is
        // actually detected. This is powered by the Metal framework.
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ImagePaintView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintView()
    }
}
