//
//  AnimationTimingBootcamp.swift
//  Demo1
//
//  Created by Piyush Sinroja on 07/04/23.
//

import SwiftUI

struct AnimationTimingBootcamp: View {
    
    @State var title = "Start"
    @State var isAnimating: Bool = false
    @State var timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State var isOn: Bool = false {
        didSet {
            if isOn {
                title = "Stop"
                timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
            } else {
                title = "Start"
                timer.upstream.connect().cancel()
            }
        }
    }
    
    var body: some View {
        VStack {
            Button(title) {
                isOn.toggle()
                isAnimating.toggle()
            }.font(.headline)
            
            .onReceive(timer) { input in
                if isOn {
                    isAnimating.toggle()
                }
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.easeIn)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.easeOut)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.easeInOut)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.linear)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.spring())
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.spring(
                    response: 0.5,
                    dampingFraction: 0.7,
                    blendDuration: 1.0
                ))
        }
    }
}

struct AnimationTimingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTimingBootcamp()
    }
}
