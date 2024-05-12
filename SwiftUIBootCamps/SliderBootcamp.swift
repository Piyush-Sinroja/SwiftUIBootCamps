//
//  SliderBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 10/04/23.
//

import SwiftUI

struct SliderBootcamp: View {
    
    @State var sliderValue: Double = 3
    @State var color: Color = .red
    
//    var body: some View {
//        VStack {
//            Text("Rating")
//            Text("\(sliderValue)")
//
//            Slider(value: $sliderValue, in: 1...5, step: 1.0)
//                .tint(Color.red)
//        }
//    }
    
    
    var body: some View {
        VStack {
            Text("Rating: ")
            Text(
            String(format: "%.0f", sliderValue)
            )
            .foregroundColor(color)
            
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 1.0,
                onEditingChanged: { (_) in
                    color = .green
                },
                minimumValueLabel: Text("1"),
                maximumValueLabel: Text("5"),
                label: {
                    Text("Title")
                })
        }
    }
}

struct SliderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SliderBootcamp()
    }
}
