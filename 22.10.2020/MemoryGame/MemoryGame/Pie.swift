//
//  Pie.swift
//  MemoryGame
//
//  Created by Oliver Gepp on 19.08.20.
//  Copyright © 2020 fhnw. All rights reserved.
//

import SwiftUI

struct Pie: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise = false
    
    var animatableData: AnimatablePair<Double, Double>{
        get{
            return AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set{
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        var p = Path()
    
        p.move(to: center)
        
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(x: center.x + radius * cos(CGFloat(startAngle.radians)),
                            y: center.y + radius * sin(CGFloat(startAngle.radians)))
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        p.addLine(to: center)
        
        return p
    }  
}



struct Pie_Previews: PreviewProvider {
    static var previews: some View {
        Pie(startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 180)).foregroundColor(.red)
    }
}
