//
//  AnimatablePairView.swift
//  Drawing
//
//  Created by Rob Ranf on 7/11/23.
//

import SwiftUI

struct AnimatablePairView: View {
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    rows = 8
                    columns = 16
                }
            }
    }
}

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Figure out how big each row/column needs to be
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        // Loop over the rows and columns, making alternating squares colored
        for row in 0..<rows {
            for column in 0..<columns {
                // swiftlint:disable:next for_where
                if (row + column).isMultiple(of: 2) {
                    // This square should be colored; add a rectangle here
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        return path
    }
}

struct AnimatablePairView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatablePairView()
    }
}
