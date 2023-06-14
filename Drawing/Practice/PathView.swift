//
//  PathView.swift
//  Drawing
//
//  Created by Rob Ranf on 6/13/23.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.closeSubpath()
        }
        // .stroke(.blue, lineWidth: 10)
        // .fill(.blue)
        // round off the corners
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        
        Triangle()
            .fill(.red)
            .frame(width: 300, height: 300)
        
        ArcDemo(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
            .stroke(.blue, lineWidth: 10)
            .frame(width: 300, height: 300)
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y:rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y:rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y:rect.minY))
        
        return path
    }
}

struct ArcDemo: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let rotationAdj = Angle.degrees(90)
        let modStart = startAngle - rotationAdj
        let modEnd = endAngle - rotationAdj
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2,
                    startAngle: modStart, endAngle: modEnd, clockwise: clockwise)
        
        return path
    }
}

struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView()
    }
}
