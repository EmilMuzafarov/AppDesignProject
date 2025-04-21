//
//  CustomShapes.swift
//  AppDesign
//
//  Created by Student on 4/11/25.
//

import SwiftUI

struct Triangle: Shape {
    var point: CGPoint
    var length: CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: point)
        path.addLine(to: CGPoint(x: point.x + length, y: point.y))
        path.addLine(to: CGPoint(x: point.x + (length / 2), y: point.y - length))
        path.closeSubpath()
        return path
    }
}


#Preview {
    Triangle(point: CGPoint(x: 1.25, y: 12.5), length: 50)
}
