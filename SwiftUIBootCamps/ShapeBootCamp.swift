//
//  ShapeBootCamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 03/04/23.
//

import SwiftUI

struct ShapeBootCamp: View {
    var body: some View {
       // Circle()
       // Ellipse()
       // Capsule(style: .continuous)
       // Rectangle()
        RoundedRectangle(cornerRadius: 50, style: .continuous)
           // .fill(Color.green)
            //.foregroundColor(.red)
            //.stroke()
            //.stroke(Color.yellow)
            //.stroke(Color.blue, lineWidth: 50)
           // .stroke(Color.orange, style: StrokeStyle(lineWidth: 30, lineCap: .round, dash: [30]))
           // .trim(from: 0.1, to: 1.0)
           // .stroke(Color.purple, lineWidth: 50.0)
        
            .frame(width: 200, height: 100)
    }
}

struct ShapeBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapeBootCamp()
    }
}
